class UsersController < ApplicationController
  before_action :set_user, except: %i(new create index correct_user)
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.selected.ordered
      .paginate(page: params[:page], per_page: Settings.records)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t ".updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t ".deleted"
    redirect_to users_url
  end

  private
  def set_user
    unless @user = User.find_by(id: params[:id])
      flash[:danger] = t ".not_found"
      redirect_to users_path
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".login"
      redirect_to login_url
    end
  end

  def correct_user
    unless current_user? @user
      flash[:danger] = t ".error_permission"
      redirect_to root_url
    end
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
