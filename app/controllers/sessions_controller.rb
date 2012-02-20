class SessionsController < ApplicationController
  
  def show
    @title = "Abnis"
  end
  
  def new
    @title = "Sign in"
  end
  
  def create
    @title = "Sign in"
    user = User.authenticate( params[:session][:email],
                              params[:session][:password])
    if user.nil?
      flash.now[:error] = "invalid email/password combination."
      #flash.now[:error] = "email: #{params[:session][:email]} -- password: #{params[:session][:password]}"
      render "new"
    else
      #flash.now[:error] = "user_id: #{user.id} - user_name: #{user.email}"
      #render "new"
      # sign_in user
      session[:user_id] = user.id #metto l'user id nel cooky localhost -> _abnis_session
      redirect_to user_path(user.id)
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end
