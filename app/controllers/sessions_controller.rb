class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:name], params[:password])
  	if user 
  		session[:user_id] = user.id 
  		redirect_to admin_url
  	else
  		redirect_to login_url, :alert => "Usernam hoặc password không đúng"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/", :notice => "tài khoản đã đăng xuất"
  end
end
