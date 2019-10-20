class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存の成功をここで扱う。
      # signup画面でユーザ作成したら作成したユーザで自動的にログインさせる
      log_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
    #入力値精査メソッド
    def user_params
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
