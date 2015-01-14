class CatsController < ApplicationController

  before_action :current_user
  before_action :is_authenticated?, :locate_cat, only: [:show, :update, :destroy, :edit]

  def index
    @cats = Cat.all
    @user = current_user
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    @tags = @cat.tags.map do |tag|
              tag.name
            end
  end

  def new
    @cat = Cat.new
    @tags = Tag.all

    @search = params[:search]
    list = flickr.photos.search :text => @search, :sort => "relevance"

    @results = list.map do |photo|
      FlickRaw.url_b(photo)
    end

    @photo = @results.sample
  end

  def edit
    @tags = Tag.all
  end

  def create
    @cat = Cat.new(cat_params)
    @tags = Tag.all

    if @cat.save
      @cat.tags.clear
      tags = params[:cat][:tag_ids]

      tags.each do |tag_id|
        @cat.tags << Tag.find(tag_id) unless tag_id.blank?
      end

      flash[:notice] = "Your cat has joined the cafe!"
      redirect_to @cat
    else
      render 'new'
    end
  end

  def update
    @cat.tags.clear

    tags = params[:cat][:tag_ids]
    tags.each do |tag_id|
      @cat.tags << Tag.find(tag_id) unless tag_id.blank?
    end

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

  def tag
    tag = Tag.find_by_name(params[:tag])
    @cats = tag ? tag.cats : []
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :desc, :img, :tag_ids, :cat_ids, :tags)
  end

  def locate_cat
    not_found unless @cat = Cat.find_by_id(params[:id])
  end
end
