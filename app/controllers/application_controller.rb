class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|      
        username == ENV['username'] && password == ENV['password']
      end
    end
  end
end
