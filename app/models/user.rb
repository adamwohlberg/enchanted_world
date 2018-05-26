class User < ActiveRecord::Base
  has_many :businesses
  has_one :setting

  after_create :create_setting_obj

  def create_setting_obj
    create_setting
  end

  def tawggle_on?
    create_setting if self.setting.blank?
    setting.tawggle_on
  end

end
