class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :json, :js, :xml
end
