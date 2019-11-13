class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @users = User.paginate(page: params[:page],per_page: 10)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_url
      flash[:success] = "Profile update"
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,
      :password_confirmation)
    end
end