class VotesController < ApplicationController

	def new
		@vote = Vote.new
	end

	def create
		@candidat = Candidat.find_by(id_candidat: params[:id])
		@vote = Vote.new()
	end

end