class VotesController < ApplicationController
	# before_action :daty
	# before_action :validat,only: [:reset]
	# after_action :validat ,only: [:verifiee]
	def new
		@candidat = Candidat.all
		@vote = Vote.new
	end

	def create
		@candidat = Candidat.find_by(id_candidat: params[:id])
		@@electeur.update(has_voting: true, code_vote: '$')
		@vote = Vote.new(candidat: @candidat, recensement: @@electeur)
		redirect_to root_path
	end

	def verification
		
	end

	def verifiee
		@electeur = Recensement.all
		@electeur.each do |electeur|
			if electeur.full_name == params[:name] && electeur.cin == params[:cin]
				@@electeur = Recensement.find_by(cin: params[:cin])
				redirect_to validation_path
			end
		end
	end

	def validation
		@recensement = @@electeur
	end

	def valider
		if @@electeur.code_vote == params[:code_de_vérification]
			redirect_to new_vote_path
		else
			render "validation"
		end
	end
	def reset
		redirect_to "validation"
	end
	private
	def validat
		@@electeur.update(code_vote: rand(999999))
	end

	def daty
		@date = Daty.last
		if @date.debut_vote >= Time.now || @date.fin_vote <= Time.now
			return true
		else
			redirect_to root_path
		end
	end

end
