class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password_digest])
    session[:user_id] = @user.id
  end

end
