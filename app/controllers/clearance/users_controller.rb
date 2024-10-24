
class Clearance::UsersController < Clearance::BaseController
  before_action :require_login, only: [:create, :new]
  #skip_before_action :require_login, only: [:create, :new], raise: false

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render template: "users/new", status: :unprocessable_entity
    end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    role = user_params.delete(:role)
    username = user_params.delete(:username)    

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.role = role
      user.username = username
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end