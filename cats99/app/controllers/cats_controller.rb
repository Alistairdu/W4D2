class CatsController < ApplicationController

  def index
     @kats = Cat.all
     render :index
  end

  def show
    @kat = Cat.find(params[:id])
    render :show
  end

  def update
    @kat = Cat.find(params[:id])
    render :edit
  end
  
  def edit
    @kat = Cat.find(params[:id])
    render :edit
  end

  def new
    @kat = Cat.new
    render :new
  end

end