class ChangesController < ApplicationController
  before_action :set_change, only: [:show , :edit]

  def index
    #@changes=Change.order(:currency_from_id, :currency_to_id)
    @changes=Change.joins(:type_change, :currency_from, :currency_to).where(type_changes: {drop: false}, currencies: {drop: false}, currency_tos_changes:{drop:false})

  end

  def show
  end

  def edit
  end

  def new
    @currencies=Currency.where(drop: :false)
    @type_changes=TypeChange.where(drop: :false)
    @change=Change.new
  end

  def create
    @change=Change.new(change_params)

    respond_to do |format|
      if @change.save
        format.html { redirect_to @change, notice: 'Cambio ha sido creado correctamente.' }
          #format.json { render :show, status: :created, location: @currency }
        else
          format.html { 
            @currencies=Currency.where(drop: :false)
            @type_changes=TypeChange.where(drop: :false)
            render :new }
          #format.json { render json: @currency.errors, status: :unprocessable_entity }
        end
      end
  end


  private
      # Use callbacks to share common setup or constraints between actions.
    def set_change
      @change = Change.find(params[:id])
    end

    def change_params
      params.require(:change).permit(:currency_from_id, :currency_to_id, :type_change_id )
    end

end
