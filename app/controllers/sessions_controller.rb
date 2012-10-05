class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to :controller=>"buyer",:action => "catalog"
  end

  def destroy
    session[:user_id] = nil
    redirect_to :controller=>"buyer",:action => "catalog"
  end
end

