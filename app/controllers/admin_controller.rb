class AdminController < ApplicationController
  layout :determine_layout
  
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :controller => :admin })
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end

  def index
  end

private
  def determine_layout
    if session[:user_id] 
      "JScorecard"
    else
      "JScorecard_noauth"
    end
  end

end
