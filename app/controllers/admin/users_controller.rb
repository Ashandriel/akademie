class Admin::UsersController < Clearance::UsersController
  before_action :require_login
  def index
    @users = User.all #whatever logic you need to retrieve the list of users 
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user= User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to [:admin, @user], notice: 'Benutzer erfolgreich gelöscht.'
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
