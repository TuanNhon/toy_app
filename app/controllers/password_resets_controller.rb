class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i(edit update)
  before_action :valid_user, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t ".email_sent"
      redirect_to root_url
    else
      flash.now[:danger] = t ".email_error"
      render :new
    end
  end

  def edit; end

  private

  def get_user
    return if @user = User.find_by(email: params[:email])
    flash.now[:danger] = t ".email_error" 
    redirect_to root_url
  end

  def valid_user
    return if @user&.activated?&.authenticated? :reset, params[:id]
    flash[:info] = t ".invalid_user"
    redirect_to root_url
  end
end
