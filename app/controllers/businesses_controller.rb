class BusinessesController < ApplicationController
  
  layout 'business'

  include YelpHelper

  def welcome
  end  

  def index
    @unicorns = Business.where(search_id: params["search_id"]).order('distance ASC')
  end

  def show
    @unicorn = Business.where(search_id: params["id"]).order('distance ASC').first
  end

  def create
    #if you are coming from show just redirect to show
    # dont keep making calls to Yelp, just use the 50 in the db
    # and get distance with geocoder
    if params["business"]["id"].present?
      redirect_to business_path(params["business"]["id"])
    end
    # {"utf8"=>"✓", "authenticity_token"=>"03uGC0A17ITKgYxcEMv2h7IwQ2GHdAOEx7CqYFydnxH8ZCabaYSnvWbEstEAK4NpBc6UNXh61stfQap2dBXBMg==", "business"=>{"search_type"=>"", "latitude"=>"", "longitude"=>"", "category"=>"", "location"=>""}, "commit"=>"Find Businesss"}
    search_type = params["business"]["search_type"] #short_press or #long_press default for testing the button
    search_type = "short_press" if search_type.blank?
    
    # base_uri = 'https://api.yelp.com/v3/autocomplete'
    term = @user.setting.search_term || 'restaurant'

    if params["business"]["latitude"] == 'localhost' || params["business"]["latitude"].blank?
      latitude = 40.0165447 
    else
      latitude = params["business"]["latitude"].to_d 
      @latitude = latitude 
    end
    if params["business"]["longitude"] == 'localhost' || params["business"]["longitude"].blank?
      longitude = -105.281686
    else
      longitude = params["business"]["longitude"].to_d 
      @longitude = longitude
    end

    #Business.find_by(longitude: @longitude, latitude: @latitude)

    puts "search_type: #{search_type}"
    puts "term: #{term}"
    puts "latitude: #{latitude}"
    puts "longitude: #{longitude}"

    businesses = yelp_search term, latitude, longitude

    poop = []
    luxury = []
    cheapo = []
    unicorns = []

    one_or_two_dollars = ['$','$$']
    three_or_four_dollars = ['$$$','$$$$']

    businesses.each do |business|
      # business is a hash
      case
      when one_or_two_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
        unicorns << business
      when one_or_two_dollars.include?(business["price"]) && ( business["rating"] < 3 )
        cheapo << business
      when three_or_four_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
        luxury << business
      when three_or_four_dollars.include?(business["price"]) && ( business["rating"] < 3 )
        poop << business
      end
    end

    if unicorns.present?
      remote_ip =  remote_ip()
      @user = User.where(ip_address: remote_ip).first
      if @user.blank?
        @user = User.create(ip_address: remote_ip)
      end

      search_id = rand.to_s[2..5]
      if search_type == 'short_press'
        unicorns.each do |unicorn|
          # dont make duplicate records for the same user
          # but update the search_id so it's retrieved in index
          @business = Business.find_by(yelp_id: unicorn['id'], user_id: @user.id)
          if @business.present?
            @business.update!(search_id: search_id)
          else
            create_business_from_yelp search_id, unicorn, @user
          end
        end
      else
        unicorn = unicorns.first
        business = Business.find_by(yelp_id: unicorn['id'])
        if business.nil?
          create_business_from_yelp search_id, unicorn, @user
        else
          search_id = business.search_id
        end
      end

      if search_id.nil?
        flash[:notice] = "There were no results found for your search."
        return redirect_to root_path
      end

      if search_type == 'short_press' 
        redirect_to businesses_path(search_id: search_id)
      elsif search_type == 'long_press'
        redirect_to business_path(search_id)
      end
    else
      flash[:notice] = "There were no results found for your search."
      redirect_to root_path
    end
  end

  # app.rb
  # Use the webpush gem API to deliver a push notiifcation merging
  # the message, subscription values, and vapid options
  def push_notifications
  # post "/push" do
    Webpush.payload_send(
      message: params[:message],
      endpoint: params[:subscription][:endpoint],
      p256dh: params[:subscription][:keys][:p256dh],
      auth: params[:subscription][:keys][:auth],
      vapid: {
        subject: "mailto:sender@example.com",
        public_key: ENV['VAPID_PUBLIC_KEY'],
        private_key: ENV['VAPID_PRIVATE_KEY']
      }
    )
  end


  private

  def create_business_from_yelp(search_id, unicorn, user)
    Business.create!(
      search_id: search_id,
      yelp_id: unicorn['id'],
      name: unicorn['name'],
      yelp_url: unicorn['url'],
      rating: unicorn['rating'],
      price: unicorn['price'],
      review_count: unicorn['review_count'],
      image_url: unicorn['image_url'],
      distance: unicorn['distance'],
      location: unicorn['location']['display_address'].first.strip,
      meta_category: 'unicorn',
      user_id: user.id, # relate the business results to a user to we dont have to keep retrieving
      latitude: unicorn['coordinates']['latitude'],
      longitude: unicorn['coordinates']['longitude']
    )
  end
end
