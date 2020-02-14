class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '登録完了'
    else
      flash.now[:danger] = '登録失敗'
      render :new
    end
  end
  
  def edit
    @user =User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.save
    redirect_to user_path(current_user.id), success: '変更完了'
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path, success: '削除完了'
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
