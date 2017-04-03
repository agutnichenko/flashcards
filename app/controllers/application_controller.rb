class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale

  def set_locale
    locale = if logged_in?
                    current_user.language
                  elsif params[:locale]
                    params[:locale]
                  else
                    session[:locale]
                  end

    if locale && I18n.available_locales.include?(locale)
      session[:locale] = I18n.locale = locale
    else
      session[:locale] = I18n.locale = I18n.default_locale
    end

  end

  private

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end
end
