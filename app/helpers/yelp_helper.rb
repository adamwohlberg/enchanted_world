module YelpHelper

  def yelp_search term, latitude, longitude, options={}
    default_options = {
        :limit => 50,
        :open_now => true,
        :sort_by => 'distance'
    }

    options = default_options.merge(options)

    begin
      api_key = ENV['YELP_API_KEY']
      response = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=#{term}&sort_by=#{options[:sort_by]}&latitude=#{latitude}&longitude=#{longitude}&open_now=#{options[:open_now]}&limit=#{options[:limit]}",
                              headers: {
                                  "Authorization" => "Bearer #{api_key}",
                                  "Content-Type" =>  "application/json"
                              }
      )
    rescue
    end

    response.parsed_response['businesses']
  end
end
