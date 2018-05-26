class SettingsController < ApplicationController

  def off_toggle
    render json: @user.setting.update_attribute(:tawggle_on, false)
  end

  def on_toggle
    render json: @user.setting.update_attribute(:tawggle_on, true)
  end

  def index
    @setting = @user.setting

    @choices = {
      'Unicorns' => 'unicorns',
      'Luxury' => 'luxury',
      'Discounts' => 'cheapo'
      # ,'Poop' => 'poop'
    }

    @categories = YELP_CATEGORIES
    # @categories = ['restaurant']

  end

  def update
    @setting = Setting.find(params[:id])
    @setting.update!(setting_params)
    # redirect_to settings_path(@setting)
    redirect_to root_path
  end
 
  private

  def setting_params
    params.require(:setting).permit!
  end

end
