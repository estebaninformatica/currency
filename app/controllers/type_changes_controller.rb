class TypeChangesController < ApplicationController
  before_action :set_type_change, only: [:show , :edit, :destroy]

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
        format.html { render :new }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end    
  end

   def destroy
    @typeChange.destroy
    respond_to do |format|
      format.html { redirect_to type_changes_url, notice: 'Type of change was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_change
      @typeChange = TypeChange.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def type_changes_params
      params.require(:type_change).permit(:name, :start_dt, :end_dt )
    end

end
