class Classroom::ClassroomController < ActionController::Base
	include Clearance::Controller
	include OwnerHelper
  before_action :require_login
	layout	'application'	
	before_action :authenticate_via_token

	protected

    def authenticate_via_token
      return unless api_token
      user = User.find_by_api_token(api_token)
      sign_in user if user
      cookies.delete(:remember_token) # so non-browser clients don't act like browsers and persist sessions in cookies
    end

  private

    def api_token
      pattern = /^Bearer /
      header  = request.env["HTTP_AUTHORIZATION"]
      header.gsub(pattern, '') if header && header.match(pattern)
    end

end