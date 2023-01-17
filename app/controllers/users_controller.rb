class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    redirect_to root_path
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end
end
