class Business < ActiveRecord::Base
  #user is anonymous so we use remote_ip to identify businesses searched for 
  # to avoid making multiple requests to Yelp
  belongs_to :user

  # validates_uniqueness_of :yelp_id, scope: :user_id

end
