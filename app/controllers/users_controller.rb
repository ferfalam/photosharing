class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update  ]
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new()
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
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

  def profilModify
    @user = User.find(current_user.id)
    @user.image = params[:user][:image]
    @user.save(validate: false)
    render :show
  end

  def show
  end
  
  

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :gender, :birthday, :password, :password_confirmation)
    end
end
