class ExchangeParitiesController < ApplicationController
  def new
    @exchange_parity=ExchangeParity.new(difference: Category.find_by(name: 'BSP').type_change.take.difference)
  end

  def create
    @exchange_parity=ExchangeParity.new(exchange_parities_params)
   
    respond_to do |format|
    
      if @exchange_parity.valid? 
        @exchange_parity.create_change_for_BSP
        @exchange_parity.create_change_for_terrestre
        @exchange_parity.create_change_for_euro
        @exchange_parity.create_change_for_dolar_euro
        format.html { redirect_to type_changes_path ,notice: 'Los datos se ingresaron correctamente'}
      else
        format.html { render :new}
      end
    end
  end

   # Never trust parameters from the scary internet, only allow the white list through.
  def exchange_parities_params
      params.require(:exchange_parity).permit(:difference, :amount_peso_dolar, :amount_peso_euro, :amount_dolar_euro)
  end
end
