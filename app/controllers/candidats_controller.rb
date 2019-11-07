class CandidatsController < ApplicationController

	def index
		
	end

	def show
		
	end

	def new
		@candidat = Candidat.new
	end

	def create
		@candidat = Candidat.new(description: params[:description])
		if @candidat.save
			redirect_to "/"
		else
			render "new"
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

end
