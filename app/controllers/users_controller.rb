class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "You sign up siccessfully!"
    else
      flash.now[:alert] = 'You filled in the text fields incorrectly!'

      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "You change your profile siccessfully!"
    else
      flash.now[:alert] = 'You filled in the text fields incorrectly!'

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(params[:id])
  end
end
