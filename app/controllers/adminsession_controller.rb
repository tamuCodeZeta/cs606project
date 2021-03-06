class AdminsessionController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:session][:email])
   
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_id] = admin.id
      redirect_to suits_path
    else
      flash[:error] = "Invalid combination of email and password."
      render 'new'
    end
  end
  
  def destroy
    adminsession[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end