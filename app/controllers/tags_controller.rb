class TagsController < ApplicationController

  before_action :current_user

  def index
    @tags = Tag.all
  end

  def show
    @tags = Tag.all
  end

# create new tag names
  def create
    @tags = Tag.all
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Your tag has joined the cafe!"
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])

    if @tag.cats.length == 0
      @tag.destroy
      flash[:notice] = "We have destroyed your tag successfully"
    else
      flash[:notice] = "We were unable to destroy your link! There is a cat attached to this tag."
    end
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tag_id, :id)
  end
end
