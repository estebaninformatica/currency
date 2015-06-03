class TypeChangesController < ApplicationController
  before_action :set_type_change, only: [:show , :edit]

  def index
    #@changes=Change.order(:currency_from_id, :currency_to_id)
    @typeChanges=TypeChange.joins(:category, :currency_from, :currency_to).where(categories: {drop: false}, currencies: {drop: false}, currency_tos_type_changes:{drop:false}).order(:id)
  end

  def show
  end

  def edit
  end

  def new
    @currencies=Currency.where(drop: :false)
    @category=Category.where(drop: :false)
    @typeChange=TypeChange.new
  end

  def create
    @typeChange=TypeChange.new(type_change_params)
    respond_to do |format|
      if @typeChange.save
        format.html { redirect_to @typeChange, notice: 'Cambio ha sido creado correctamente.' }
          #format.json { render :show, status: :created, location: @currency }
        else
          format.html { 
            @currencies=Currency.where(drop: :false)
            @category=Category.where(drop: :false)
            render :new }
          #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end


  private
      # Use callbacks to share common setup or constraints between actions.
    def set_type_change
      @typeChange = TypeChange.find(params[:id])
    end

    def type_change_params
      params.require(:type_change).permit(:currency_from_id, :currency_to_id, :category_id, :difference )
    end


end
