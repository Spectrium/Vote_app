class ProfilsController < ApplicationController

	def create
		@candidat = Candidat.find(params[:candidat_id])
		@candidat.profil.attach(params[:profil])
		redirect_to (candidat_path(@candidat))
	end

end
