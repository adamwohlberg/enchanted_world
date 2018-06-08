class Business < ActiveRecord::Base

  DEFAULT_SEARCH_TYPE = 'short_press'

  #user is anonymous so we use remote_ip to identify businesses searched for 
  # to avoid making multiple requests to Yelp
  belongs_to :user
  scope :filter_by_id, ->(ids) { where('search_id IN (?)', ids).order('distance ASC') }
  # validates_uniqueness_of :yelp_id, scope: :user_id

end
