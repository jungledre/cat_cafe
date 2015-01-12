class CafesController < ApplicationController

  def index
    @happy_cat = "≧◠‿◠≦✌"
    @cats = Cat.all
  end

  def create
    @cat = Cat.new(params.require(:cat).permit(:name, :desc, :img))
    @cat.save
    redirect_to @cat
  end

  def show
    @cat = Cat.find(params.require(:id))
  end

  def new
    @search = params[:search]
    list = flickr.photos.search :text => @search, :sort => "relevance"

    @results = list.map do |photo|
      FlickRaw.url_b(photo)
    end

    @photo = @results.sample
  end
end
