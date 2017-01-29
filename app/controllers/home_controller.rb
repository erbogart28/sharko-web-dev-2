class HomeController < ApplicationController
  before_action :logged_in_user, only: [:toppage]
  before_action :correct_user,   only: [:user_entry]
  before_action :admin_user,     only: [:toppage]




def toppage
    
end

def user_entry
    flash[:danger] = "Admin Access Only."
    redirect_to root_path
end





  private
    # Use callbacks to share common setup or constraints between actions.
    def user_params
        params.require(:user).permit(:FullName, :email, :password,
                                   :PhoneNumber)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Admin Access Only."
        redirect_to login_url
        
      end
    end
    
            # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)         
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
