class MangasController < ApplicationController
  #before_action :set_manga, only: [:show, :edit, :update, :destroy]
load_and_authorize_resource

  def index
    @mangas = Manga.all
  end


  def show
  end


  def new
    @manga = Manga.new
  end


  def edit
  end


  def create
    @manga = Manga.new(params.require(:manga).permit(:title, :description, :support_id, :image, :genre_id))


      if @manga.save
        redirect_to @manga, notice: 'Le Manga a été créer avec succès.'
      else
        render :new
      end
    end



  def update
          @manga = Manga.find(params[:id])
          if @manga.update(manga_params)
                  redirect_to @manga
          else
                  render 'edit'
          end
    end



  def destroy
          @manga = Manga.find(params[:id])
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
      params.require(:manga).permit(:title, :description, :support_id, :genre_id, :image )
    end
end
