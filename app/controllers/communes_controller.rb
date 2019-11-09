class CommunesController < ApplicationController

	def index
		@region = Region.find(id: params[:id])
	end

	def destroy
		@commune = Commune.find(id: params[:id])
		@fokontany = commune.fokontanies.all
		@fokontany.each do |fokontany|
			fokontany.recensements.destroy_all
		end
		commune.fokontanies.destroy
		@commune.destroy
	end
end
