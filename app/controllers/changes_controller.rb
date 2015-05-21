class ChangesController < ApplicationController
  before_action :set_change, only: [:show , :edit]

  def index
    @changes=Change.all.order(:currency_from_id, :currency_to_id)
  end

  def show
  end

  def edit
  end

  def new
    @currencies=Currency.all
    @type_changes=TypeChange.all
    @change=Change.new
  end

  def create
    @change=Change.new(change_params)

    respond_to do |format|
      if @change.save
        format.html { redirect_to @change, notice: 'Change was successfully created.' }
          #format.json { render :show, status: :created, location: @currency }
        else
          format.html { 
            @currencies=Currency.all
            @type_changes=TypeChange.all
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
