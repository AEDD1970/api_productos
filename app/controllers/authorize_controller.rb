class AuthorizeController < ApplicationController
  include ActionController::MimeResponds
 

  unless Rails.env.development?
    before_action :authenticate_user!
    load_and_authorize_resource
    rescue_from CanCan::AccessDenied do |exception|
      result = {
          :permission => false,
          :alert      => exception.message,
          :action     => exception.action
      }
      Airbrake.notify(exception) unless Rails.env.development?
      self.render_default_error result, 401
    end
  end
end
