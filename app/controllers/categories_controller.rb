class CategoriesController < ApplicationController
   before_action :set_category, only: [:show , :edit, :destroy]

  def index
    @categories=Category.where(drop: :false)
  end

  def show
  end

  def new
    @category=Category.new
  end

  def edit
  end

  def create
    @category=Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'La categoria se ha creado correctamente.' }
        #format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end    
  end

   def destroy
    @category.drop_logic
    @category.save
    respond_to do |format|
      format.html { redirect_to category_url, notice: 'Tipo de cambio fue eliminado.' }
      #format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
