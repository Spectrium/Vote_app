class ProfilsController < ApplicationController

	def create
		@candidat = Candidat.find(params[:candidat_id])
		@candidat.profil.attach(params[:profil])
		redirect_to edit_candidat_path(params[:candidat_id])
	end

end