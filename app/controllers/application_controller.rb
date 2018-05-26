class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :remote_ip, :current_user
  before_action :authenticate_browser!

  private
    def remote_ip
      ip = if request.remote_ip == '127.0.0.1' || "::1"
        # Hard coded remote address
        '208.184.3.194'
      else
        request.remote_ip
      end
    end


    def current_user
      @user ||= User.where(ip_address: remote_ip).first_or_create
    end

    def authenticate_browser!
      if browser.safari?
        redirect_to '/safari'
      end
    end

end
