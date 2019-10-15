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
    #debugger
    if @user.save
      # 成功時に表示するメッセージ
      flash[:success] = "Welcome to the Sample App!"
      # リダイレクト
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
    #入力値精査メソッド
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  

end
