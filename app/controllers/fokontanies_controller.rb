class FokontaniesController < ApplicationController

  def index
  	@commune = Commune.find(id: params[:id])
  end

  def destroy
  	@fokontany = Fokontany.find(id: params[:id])
  	@fokontany.recensements.destroy_all
  	@fokontany.destroy
  end

end
