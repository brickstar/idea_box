class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def show
    render file: '/public/404.html'
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = 'Idea Saved!'
      redirect_to user_path(@user)
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @idea.update(idea_params)
      flash[:success] = 'Idea Updated!'
      redirect_to user_path(@user)
    else
      @categories = Category.all
      render :new
    end
  end

  def destroy

  end

  private

  def idea_params
   params.require(:idea).permit(:title, :description, :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
