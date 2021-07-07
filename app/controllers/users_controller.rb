class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  #skip_before_action :login_

  def new
    @user = User.new()
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def profilModify
    @user = User.find(1)
    @user.image = params[:user][:image]
    @user.save(validate: false)
    render :edit
  end
  

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :gender, :birthday, :password, :password_confirmation)
    end
end
