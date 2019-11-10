class VotesController < ApplicationController
	# before_action :daty
	# before_action :validat,only: [:reset]
	# after_action :validat ,only: [:verifiee]
	def new
		@candidat = Candidat.all
		# @@elect = @@electeur
		@vote = Vote.new
	end

	def create
		@candidat = Candidat.find_by(id: params[:candidat_id])
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
				if @@electeur.has_voting != true
					redirect_to validation_path
				else
					redirect_to root_path
				end
			end
		end
	end

	def validation
		@@code = rand(999999)
		puts "**************************"
		puts @@code
		puts "**************************"
	end

	def valider
		code_valeur = params[:code_de_vérification].to_i
		if @@code == code_valeur  
			redirect_to new_vote_path
		else
			render "validation"
		end
		
	end

	private

	def daty
		@date = Daty.last
		if @date.debut_vote >= Time.now || @date.fin_vote <= Time.now
			return true
		else
			redirect_to root_path
		end
	end

end
