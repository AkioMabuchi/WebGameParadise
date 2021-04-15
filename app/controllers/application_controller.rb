class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale

  def set_locale
    @locale_react_info = {
      authenticityToken: form_authenticity_token,
      locale: I18n.locale,
      languages: Language.order(name: :asc).select(:permalink, :name)
    }
  end

  def switch_locale(&action)
    locale = extract_locale_from_subdomain || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def change_locale
    protocol = request.protocol
    locale = params[:locale]
    host = (Rails.env.production? or Rails.env.staging?) ? "webgameparadise.com" : "localhost.local:3000"
    path = URI(request.referer).path

    redirect_to "#{protocol}#{locale}.#{host}#{path}"
  end
  private

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
