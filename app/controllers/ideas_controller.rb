class IdeasController < ApplicationController
  def new
    @categories = Category.all
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = 'Idea Saved!'
      redirect_to user_path(@user)
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def idea_params
   params.require(:idea).permit(:title, :description, :category_id)
  end
end
