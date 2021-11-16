class SessionsController < ApplicationController
  def new
    # redirect to main page after login
    redirect_to :root if current_user
  end
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # save the user id as cookie
      session[:user_id] = user.id
      redirect_to :root
    else
       # if doesn't work, redirect to login page
       redirect_to '/login'
    end 
  end

  def destroy
    # clear cookie
    session[:user_id] = nil
    redirect_to '/login'
  end
end
