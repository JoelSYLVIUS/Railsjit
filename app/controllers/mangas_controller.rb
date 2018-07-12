class MangasController < ApplicationController
  before_action :set_manga, only: [:show, :edit, :update, :destroy]


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
    @manga = Manga.new(params.require(:manga).permit(:title, :description, :thumbnail))


      if @manga.save
        flash[:success] = "Le Manga #{@manga.title} a été créer avec succès."
        redirect_to @manga
      else
        render :new
      end
    end


  #def update

   #   if @manga.update(manga_params)
   #     flash[:success] = "Le Manga #{@manga.title} a été modifier avec succès."
   #     redirect_to @manga
   #   else
   #     render :edit
   #   end
  #end




  def destroy
    @manga.destroy
    flash[:success] = "Le Manga #{@manga.title} a été supprimer avec succès."
    redirect_to mangas_url
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
end
