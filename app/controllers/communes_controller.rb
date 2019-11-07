class CommunesController < ApplicationController

	def index
		@region = Region.find(id: params[:id])
	end

end
