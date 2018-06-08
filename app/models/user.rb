class User < ActiveRecord::Base
  has_many :businesses
  has_one :setting

  after_create :create_setting

  delegate :search_term, to: :setting, allow_nil: true

  #removed setting create logic becuase we are having after_create callback.
  def setting_tawggle_on?
    setting && setting.tawggle_on ? setting.tawggle_on : false
  end

end
