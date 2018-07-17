class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
authorize_resource

  def index
    @supports = Support.all
  end


  def show
  end


  def new
    @support = Support.new
  end


  def edit
  end


  def create
    @support = Support.new(support_params)

      if @support.save
        redirect_to @support, notice: 'Support was successfully created.'
      else
        render :new
      end

  end


  def update

      if @support.update(support_params)
         redirect_to @support, notice: 'Support was successfully updated.'
      else
        render :edit
      end

  end


  def destroy
    @support.destroy

     redirect_to supports_url, notice: 'Support was successfully destroyed.'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_params
      params.require(:support).permit(:title)
    end
end
