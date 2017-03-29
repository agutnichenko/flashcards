class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale

  def set_locale
    I18n.locale = if logged_in?
                    current_user.language
                  elsif params[:locale]
                    params[:locale]
                  else
                    extract_locale_from_accept_language_header
                  end
  end

  private

  def extract_locale_from_accept_language_header
    params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.presence
  end

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end
end
