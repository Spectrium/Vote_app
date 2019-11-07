class RegionsController < ApplicationController
	def index
		@region = Region.all
	end

end
