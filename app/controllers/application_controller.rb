class ApplicationController < ActionController::Base
  before_filter :set_gettext_locale
  protect_from_forgery
end
