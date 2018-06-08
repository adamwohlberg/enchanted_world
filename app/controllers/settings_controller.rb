class SettingsController < ApplicationController

  def index
    @choices = {
      'Unicorns' => 'unicorns',
      'Luxury' => 'luxury',
      'Discounts' => 'cheapo'
      # ,'Poop' => 'poop'
    }
    @categories = [@user.search_term].compact
  end

  def update
    setting = Setting.find(params[:id])
    
    setting.update!(setting_params)
    # redirect_to settings_path(setting)
    redirect_to root_path
  end

  def off_toggle
    render json: @user.setting.update_attribute(:tawggle_on, false)
  end

  def on_toggle
    render json: @user.setting.update_attribute(:tawggle_on, true)
  end

  def yelp_categories
    categories = YelpService.get_categories(params[:q]).each_with_object([]) do |category, list|
      list << { id: category['title'], text: category['title'] }
    end
    render json: categories.compact
  end

  private

  def setting_params
    params.require(:setting).permit!
  end

end
