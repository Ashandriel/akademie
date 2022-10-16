class Admin::AdminController < ActionController::Base
	include Clearance::Controller
  before_action :require_login
	layout	'application'
end