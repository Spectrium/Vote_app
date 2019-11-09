class RegionsController < ApplicationController

	def index
		@region = Region.all
	end

	def destroy
		@region = Region.find(id: params[:id])
		@commune = @region.communes.all
		@commune.each do |commune|
			@fokontany = commune.fokontanies.all
			@fokontany.each do |fokontany|
				fokontany.recensements.destroy_all
			end
			commune.fokontanies.dest
		end
		@commune.destroy
		@region.destroy
	end

end
