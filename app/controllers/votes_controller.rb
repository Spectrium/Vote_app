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
		@@code = rand(999999)
		puts "********************************************"
		puts @@code
		puts "********************************************"
		# @@electeur.update(code_vote: @code)
		# @recensement = @@electeur
		# puts "********************************************"
		# puts "electeur code_vote : #{@recensement.code_vote}" 
		# puts "********************************************"
	end

	def valider
<<<<<<< HEAD
		@electeur = Recensement.all
		test = 0
		@eleceur.each do |elect|
			if elect.code_vote == params[:code_de_vérification]
				test = 1
				break
			else
				test = 0
			end
		end
		if test == 1 
=======
		puts "********************************************"
		puts "METHODE VALIDER"
		puts @@code
		puts "********************************************"
		code_valeur = params[:code_de_vérification].to_i
		if @@code == code_valeur  
>>>>>>> 5f2ba8963c8e4f4c936d9ed34657ff342669ac7d
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
		@@code = rand(999999)
		puts "********************************************"
		puts @@code
		puts "********************************************"
		@@electeur.update(code_vote: @code)
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
