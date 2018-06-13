class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]


  def index
    @mangas = Manga.all
  end


  def show
  end


  def new

  end


  def edit
  end


  def create



      if @manga.save
        redirect_to @manga, notice: 'Le Manga a été créer avec succès.'
      else
        render :new
      end
    end
  end


  def update
      if @manga.update(manga_params)
        redirect_to @manga, notice: 'Le Manga a été modifier avec succès.'
      else
        render :edit
      end
    end



  def destroy
    @manga.destroy
      redirect_to mangas_url, notice: 'Le Manga a été supprimer avec succès.'
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manga
      @manga = Manga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manga_params
      params.fetch(:manga, {})
    end
