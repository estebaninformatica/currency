class ChangeHistoricalsController < ApplicationController
  before_action :set_change_historical, only: [:show , :edit]
  
  def index
    @changeHistoricals=ChangeHistorical.all.order(:change_id)
  end

  def show
  end

  def edit
  end

  def new
    @changeHistorical=ChangeHistorical.new
  end

  def create
    @changeHistorical=ChangeHistorical.new(change_historical_params)
    respond_to do |format|
      if @changeHistorical.save
        format.html { redirect_to @changeHistorical.change, notice: 'New value for Change was successfully created.' }
        #format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_historical
      @changeHistorical = ChangeHistorical.find(params[:id])
    end

    def change_historical_params
      params.require(:change_historical).permit(:change_id ,:amount )
    end

  end
