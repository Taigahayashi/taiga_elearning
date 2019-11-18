class Admin::UsersController < ApplicationController
  def home
        
  end

  def index
    @users = User.paginate(page: params[:page],per_page: 10)
  end

  def destroy
    @user = User.find(params[:id])
    flash[:info] = "Successflly Removed user"
    @user.destroy
    redirect_to admin_category_url
  end
    
		
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,
      :password_confirmation)
    end
end
