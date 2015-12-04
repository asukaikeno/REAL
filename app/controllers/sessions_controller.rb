class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash.now[:danger] = 'パスワードかアドレスが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    log_out
    redirect_to root_url
  end

end