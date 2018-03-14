class BusinessesController < ApplicationController
  
  layout 'business'

  def welcome
  end  

  def index
    @unicorns = Business.where(search_id: params["search_id"])
  end

  def show
    @unicorn = Business.where(search_id: params["search_id"]).order('distance ASC').first
  end

  def create
    {"utf8"=>"✓", "authenticity_token"=>"03uGC0A17ITKgYxcEMv2h7IwQ2GHdAOEx7CqYFydnxH8ZCabaYSnvWbEstEAK4NpBc6UNXh61stfQap2dBXBMg==", "business"=>{"search_type"=>"", "latitude"=>"", "longitude"=>"", "category"=>"", "location"=>""}, "commit"=>"Find Businesss"}

    search_type = params["business"]["search_type"] #short_press or #long_press default for testing the button
    search_type = "short_press" if search_type.blank?
    
    # base_uri = 'https://api.yelp.com/v3/autocomplete'
    term = 'restaurant'    

    if params["business"]["latitude"] == 'localhost' || params["business"]["latitude"].blank?
      latitude = 40.0165447 
    else
      latitude = params["business"]["latitude"].to_d 
    end
    if params["business"]["longitude"] == 'localhost' || params["business"]["longitude"].blank?
      longitude = -105.281686
    else
      longitude = params["business"]["longitude"].to_d 
    end

    puts "search_type: #{search_type}"
    puts "term: #{term}"
    puts "latitude: #{latitude}"
    puts "longitude: #{longitude}"

    begin 
      @api_key = ENV['YELP_API_KEY']
        @results = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{term}&latitude=#{latitude}&longitude=#{longitude}", 
          headers: {
            "Authorization" => "Bearer #{@api_key}", 
            "Content-Type" =>  "application/json"
          }
        )
    rescue
    end

    @businesses =  @results.first.second

    @poop = []
    @luxury = []
    @cheapo = []
    @unicorns = []

    one_or_two_dollars = ['$','$$']
    three_or_four_dollars = ['$$$','$$$$']

    @businesses.each do |business|
      # business is a hash
      case
      when one_or_two_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
        @unicorns << business
      when one_or_two_dollars.include?(business["price"]) && ( business["rating"] < 3 )
        @cheapo << business
      when three_or_four_dollars.include?(business["price"]) && ( business["rating"] >= 4 )
        @luxury << business
      when three_or_four_dollars.include?(business["price"]) && ( business["rating"] < 3 )
        @poop << business
      end
    end

    if @unicorns.present?
      search_id = rand.to_s[2..5] 
      @unicorns.each do |unicorn|
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
          meta_category: 'unicorn'
          )
      end


      if search_type == 'short_press' 
        redirect_to unicorn_path(search_id: search_id)
      elsif search_type == 'long_press' #this is the unicorn locator
        redirect_to unicorn_locator_path(search_id: search_id)
      end
    else
      render root_path
    end
  end

end
