require 'active_support/deprecation'

class Clearance::PasswordsController < Clearance::BaseController
  before_action :ensure_existing_user, only: [:edit, :update]
  before_action :ensure_email_present, only: [:create]
  skip_before_action :require_login, only: [:create, :edit, :new, :update], raise: false

  def new
    render template: "passwords/new"
  end

  def create
    if user = find_user_for_create
      user.forgot_password!
      deliver_email(user)
    end

    render template: "passwords/create", status: :accepted
  end

  def edit
    @user = find_user_for_edit

    if params[:token]
      session[:password_reset_token] = params[:token]
      redirect_to url_for
    else
      render template: "passwords/edit"
    end
  end

  def update
    @user = find_user_for_update

    if @user.update_password(password_from_password_reset_params)
      sign_in @user if Clearance.configuration.sign_in_on_password_reset?
      redirect_to url_after_update, status: :see_other
      session[:password_reset_token] = nil
    else
      flash_failure_after_update
      render template: "passwords/edit", status: :unprocessable_entity
    end
  end

  private

  def deliver_email(user)
    ::ClearanceMailer.change_password(user).deliver_now
  end

  def password_from_password_reset_params
    params.dig(:password_reset, :password)
  end

  def find_user_by_id_and_confirmation_token
    user_param = Clearance.configuration.user_id_parameter
    token = params[:token] || session[:password_reset_token]

    Clearance.configuration.user_model.
      find_by(id: params[user_param], confirmation_token: token.to_s)
  end

  def email_from_password_params
    params.dig(:password, :email)
  end

  def find_user_for_create
    Clearance.configuration.user_model.
      find_by_normalized_email(email_from_password_params)
  end

  def find_user_for_edit
    find_user_by_id_and_confirmation_token
  end

  def find_user_for_update
    find_user_by_id_and_confirmation_token
  end

  def ensure_email_present
    if email_from_password_params.blank?
      flash_failure_when_missing_email
      render template: "passwords/new", status: :unprocessable_entity
    end
  end

  def ensure_existing_user
    unless find_user_by_id_and_confirmation_token
      flash_failure_when_forbidden
      render template: "passwords/new", status: :unprocessable_entity
    end
  end

  def flash_failure_when_forbidden
    flash.now[:alert] = translate(:forbidden,
      scope: [:clearance, :controllers, :passwords],
      default: t("flashes.failure_when_forbidden"))
  end

  def flash_failure_after_update
    flash.now[:alert] = translate(:blank_password,
      scope: [:clearance, :controllers, :passwords],
      default: t("flashes.failure_after_update"))
  end

  def flash_failure_when_missing_email
    flash.now[:alert] = translate(:missing_email,
      scope: [:clearance, :controllers, :passwords],
      default: t("flashes.failure_when_missing_email"))
  end

  def url_after_update
    Clearance.configuration.redirect_url
  end
end