class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = 'Username already exists'
      redirect_to new_user_path
    end
  end

  def show
    if User.where(id: params[:id]).empty? || User.find(params[:id]) != current_user
      render file: 'public/404.html'
    else
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
