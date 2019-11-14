class RecherchesController < ApplicationController
	def index
		@params = params[:find]
		@recensement = Recensement.where(['cin LIKE ?',"%#{@params}%"])
		@recensement = Recensement.where(['full_name LIKE ?',"%#{@params}%"])
	end
end
