class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  skip_before_filter :verify_authenticity_token,
      :if => Proc.new { |c| c.request.format == 'application/json' }

  def current_user
    if session[:api_key]
      User.find_by_api_key(session[:api_key])
    end
  end
end
