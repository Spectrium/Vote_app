class FokontaniesController < ApplicationController

  def index
  	@commune = Commune.find(id: params[:id])
  end

end
