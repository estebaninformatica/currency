class TypeChangesController < ApplicationController
  before_action :set_type_change, only: [:show , :edit]
  before_action :set_currencies, only: [:new, :edit]

  def index
    @typeChanges=TypeChange.all
  end

  def show
  end

  def new
    @typeChange=TypeChange.new
  end

  def edit
  end

  def create
    @typeChange=TypeChange.new(type_changes_params)

    respond_to do |format|
      if @typeChange.save
        format.html { redirect_to @typeChange, notice: 'Type change was successfully created.' }
        #format.json { render :show, status: :created, location: @currency }
      else

        format.html { 
          set_currencies 
          render :new
        }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_change
      @typeChange = TypeChange.find(params[:id])
    end
    
    def set_currencies
      @currencies=Currency.all  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_changes_params
      params.require(:type_change).permit(:currency_from, :currency_to , :name, :start_dt, :end_dt,:amount  )
    end

end
