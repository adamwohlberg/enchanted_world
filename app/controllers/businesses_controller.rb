class BusinessesController < ApplicationController
  layout 'business'

  def index
    @unicorns = Business.filter_by_id(params["search_id"])
  end

  def show
    @unicorn = Business.filter_by_id(params["search_id"]).first
  end

  # {"utf8"=>"✓", "authenticity_token"=>"03uGC0A17ITKgYxcEMv2h7IwQ2GHdAOEx7CqYFydnxH8ZCabaYSnvWbEstEAK4NpBc6UNXh61stfQap2dBXBMg==", "business"=>{"search_type"=>"", "latitude"=>"", "longitude"=>"", "category"=>"", "location"=>""}, "commit"=>"Find Businesss"}
  def create
    #if you are coming from show just redirect to show
    # dont keep making calls to Yelp, just use the 50 in the db

    # one_or_two_dollars = ['$','$$']
    # three_or_four_dollars = ['$$$','$$$$']

    # businesses.each do |business|
    #   # business is a hash
    #   case
    #   when one_or_two_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
    #     unicorns << business
    #   #below when conditions is not goinig to use we can remove it.
    #   when one_or_two_dollars.include?(business["price"]) && ( business["rating"] < 3 )
    #     cheapo << business
    #   when three_or_four_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
    #     luxury << business
    #   when three_or_four_dollars.include?(business["price"]) && ( business["rating"] < 3 )
    #     poop << business
    #   end
    # end

    redirect_to business_path(params['business']['id']) if params['business']['id'].present?

    unicorns = get_available_unicorns
    if unicorns.present?
      #short_press or #long_press default for testing the button
      search_type = params.dig('business', 'search_type') || Business::DEFAULT_SEARCH_TYPE
      search_id = rand.to_s[2..5]

      if search_type == Business::DEFAULT_SEARCH_TYPE
        create_unavailable_businesses_for_unicorns(unicorns, search_id)
        redirect_to businesses_path(search_id: search_id)
      else
        business = find_or_create_business_for_unicorn(unicorns.first, search_id)
        search_id = business.search_id
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

  def get_available_unicorns
    businesses = all_business_for_current_user
    businesses.select(&one_or_two_dollars_business_with_rating_greater_than_four)
  end

  def all_business_for_current_user
    # we can make YelpService to accept hash in argument
    term = current_user.search_term || 'restaurant'
    limit = '50' #default 20 max 50  
    open_now = true
    sort_by = 'distance'
    YelpService.get_businesses(term, sort_by, get_latitude, get_longitude, open_now, limit)  
  end

  def get_latitude
    return 40.0165447 if params["business"]["latitude"] == 'localhost' || params["business"]["latitude"].blank?
    params["business"]["latitude"].to_d 
  end

  def get_longitude
    return -105.281686 if params["business"]["longitude"] == 'localhost' || params["business"]["longitude"].blank?
    params["business"]["longitude"].to_d 
  end

  def one_or_two_dollars_business_with_rating_greater_than_four
    one_or_two_dollars = ['$','$$']
    Proc.new { |business| one_or_two_dollars.include?(business['price']) && business['rating'] >= 4 }
  end

  def create_unavailable_businesses_for_unicorns(unicorns, search_id)
    unicorns.each do |unicorn|
      next if Business.exists?(yelp_id: unicorn['id'], user_id: current_user.id)
      create_business(search_id, unicorn)
    end
  end

  def find_or_create_business_for_unicorn(unicorn, search_id)
    business = Business.find_by(yelp_id: unicorn['id'])
    business || create_business(search_id, unicorn)
  end

  def create_business(search_id, unicorn)
    Business.create!(
      search_id: search_id,
      yelp_id: unicorn["id"],
      name: unicorn["name"],
      yelp_url: unicorn["url"],
      rating: unicorn["rating"], 
      price: unicorn["price"],
      review_count: unicorn["review_count"],
      image_url: unicorn["image_url"],
      distance: unicorn["distance"],
      location: unicorn["location"]["display_address"].first.strip,
      meta_category: 'unicorn',
      user_id: @user.id, # relate the business results to a user to we dont have to keep retrieving
      latitude: unicorn['coordinates']["latitude"],
      longitude: unicorn['coordinates']["longitude"]
    )
  end
end
