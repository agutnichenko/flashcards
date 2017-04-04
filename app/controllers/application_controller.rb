class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :require_login

  def set_locale
    locale = if logged_in?
               current_user.language
             elsif params[:locale]
               params[:locale]
             else
               session[:locale]
             end

    if locale && I18n.available_locales.include?(locale.to_sym)
      session[:locale] = I18n.locale = locale
    else
      session[:locale] = I18n.locale = I18n.default_locale
    end

  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  private

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end
end
