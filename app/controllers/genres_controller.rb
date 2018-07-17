class GenresController < ApplicationController
  #before_action :set_genre, only: [:show, :edit, :update, :destroy]
 load_and_authorize_resource

  def index
    @genres = Genre.all
  end


  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

      if @genre.save
         redirect_to @genre, notice: 'Genre was successfully created.'

      else
         render :new

      end
  end

  def update
      if @genre.update(genre_params)
              redirect_to @genre, notice: 'Genre was successfully updated.'

      else
              render :edit
      end
  end


  def destroy
          @genre = Genre.find(params[:id])
          @genre.destroy
      redirect_to genres_url, notice: 'Le genre a été supprimer avec succès.'
    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:title)
    end
end
