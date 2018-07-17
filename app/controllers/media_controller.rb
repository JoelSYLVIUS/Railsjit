class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]


  def index
    @media = Medium.all
  end


  def show
  end


  def new
    @medium = Medium.new
  end


  def edit
  end


  def create
    @medium = Medium.new(medium_params)

    respond_to do |format|
      if @medium.save
        redirect_to @medium, notice: 'Medium was successfully created.'

      else
        render :new
      end
    end
  end


  def update

      if @medium.update(medium_params)
        redirect_to @medium, notice: 'Medium was successfully updated.'
      else
              render :edit
      end
    end
  end


  def destroy
    @medium.destroy
       redirect_to media_url, notice: 'Medium was successfully destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:title)
    end
end
