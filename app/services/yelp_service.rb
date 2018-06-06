class YelpService
  attr_reader :api_key

  def initialize
    @api_key = ENV['YELP_API_KEY']
  end

  def connect(endpoint, opts)
    url = build_url(endpoint, opts)
    begin
      HTTParty.get(
        url,
        headers: {
          "Authorization" => "Bearer #{api_key}",
          "Content-Type" =>  "application/json"
        }
      )
    rescue
    end
  end

  def self.get_businesses(term, sort_by, latitude, longitude, open_now, limit)
    # latitude = 40.0165447
    # longitude = -105.281686
    opts = { term: term, sort_by: sort_by, latitude: latitude, longitude: longitude, open_now: open_now, limit: limit }
    new.connect('search', opts).parsed_response['businesses'] || []
  end

  def self.get_categories(text)
    new.connect('autocomplete', text: text).parsed_response['categories'] || []
  end

  def base_url
    "https://api.yelp.com/v3/"
  end

  def build_url(endpoint, opts)
    url_params = URI.encode_www_form(opts)
    "#{base_url}#{endpoint}?#{url_params}"
  end
end