class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]


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
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  def update
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }

      else
        format.html { render :edit }

      end
    end


  def destroy
    @genre.destroy
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }

    end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genre_params
      params.require(:genre).permit(:titre)
    end
