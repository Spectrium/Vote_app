class RecherchesController < ApplicationController
	def index
		@params = params[:find]
		@recensement_cin = Recensement.where(['cin LIKE ?',"%#{@params}%"])
		@recensement_name = Recensement.where(['full_name LIKE ?',"%#{@params}%"])
	end
end
