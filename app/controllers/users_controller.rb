class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :all_day_check, :memo))
    if @user.save
     redirect_to :users
     flash[:notice] = "スケジュールを作成しました"
    else
     render "new"
    end
  end

  def show
   @user = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start_date, :end_date, :all_day_check, :memo))
     flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
     redirect_to :users
    else
     render "edit"
    end
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = "スケジュールを削除しました"
   redirect_to :users
  end

end
