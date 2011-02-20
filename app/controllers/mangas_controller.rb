class MangasController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new(params[:manga])
    if @manga.save
      redirect_to mangas_url, :notice => "Successfully created manga."
    else
      render :action => 'new'
    end
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])
    if @manga.update_attributes(params[:manga])
      redirect_to mangas_url, :notice  => "Successfully updated manga."
    else
      render :action => 'edit'
    end
  end
end
