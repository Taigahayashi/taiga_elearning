class Admin::UsersController < ApplicationController
  def home
        
  end

  def index
    @users = User.paginate(page: params[:page],per_page: 10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(admin: false)
    redirect_to admin_users_url
	end
	
	def update
		@user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to admin_users_url
  end
    
		
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,
      :password_confirmation)
    end
end
