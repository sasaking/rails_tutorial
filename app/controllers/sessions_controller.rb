class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ログインできたらユーザIDをセッション変数に格納する
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      #redirect_to user
      #フレンドリーフォワーディングがあれば、そちらに画面遷移する。
      redirect_back_or user
    else
      #debugger
      flash.now[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render 'new'
    end
  end
  
  def destroy
    # ログアウトさせるメソッド呼び出し(session_helperに設定)
    log_out if logged_in?
    redirect_to root_url
  end
end
