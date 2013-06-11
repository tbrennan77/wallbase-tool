class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    unless Rails.env == "development"        
      authenticate_or_request_with_http_basic do |username, password|      
        username == 'johnsonite16910' && password == "johnsonite"
      end
    end
  end
end
