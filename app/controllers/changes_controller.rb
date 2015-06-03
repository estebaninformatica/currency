class ChangesController < ApplicationController
  before_action :set_change, only: [:show , :edit]
  
  def index
    @changes=Change.all.order(:type_change_id, :id)
  end

  
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change
      @change = Change.find(params[:id])
    end

    def change_params
      params.require(:change).permit(:type_change_id ,:amount )
    end

end
