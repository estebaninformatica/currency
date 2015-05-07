class TypeChangesController < ApplicationController
  before_action :set_type_change, only: :show 

  def index
    @typeChanges=TypeChange.all
  end

  def show
  end

  def new
    @typeChange=TypeChange.new
    @currencies=Currency.all
  end

  def create
    params[:currency_from]
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_change
      @typeChange = TypeChange.find(params[:id])
    end
end
