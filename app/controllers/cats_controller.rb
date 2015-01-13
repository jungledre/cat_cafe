class CatsController < ApplicationController

  before_action :current_user
  before_action :is_authenticated?, :locate_cat, only: [:show, :update, :destroy, :edit]

  def index
    @cats = Cat.all
    @user = current_user
  end

  def show
  end

  def new
    @cat = Cat.new

    @search = params[:search]
    list = flickr.photos.search :text => @search, :sort => "relevance"

    @results = list.map do |photo|
      FlickRaw.url_b(photo)
    end

    @photo = @results.sample
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      flash[:notice] = "Your cat has joined the cafe!"
      redirect_to @cat
    else
      render 'new'
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render 'edit'
    end
  end

  def destroy
    if @cat.destroy
      flash[:notice] = "We have destroyed your cat successfully"
      redirect_to cats_path
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :desc, :img)
  end

  def locate_cat
    not_found unless @cat = Cat.find_by_id(params[:id])
  end
end
