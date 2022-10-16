class Classroom::ClassroomController < ActionController::Base
	include Clearance::Controller
	include OwnerHelper
  before_action :require_login
	layout	'application'	

end