class CandidatsController < ApplicationController

	def index
		@candidat = Candidat.all
	end

	def show
		
	end

	def new
		@candidat = Candidat.new
	end

	def create
		@candidat = Candidat.new(full_name: params[:full_name], parti: params[:parti], description: params[:description])
		if @candidat.save
			redirect_to "/"
		else
			render "new"
		end
	end

	def edit
		@candidat = Candidat.find(id: params[:id])
	end

	def update
		@candidat = Candidat.update(full_name: params[:full_name], parti: params[:parti], description: params[:description])
		if @candidat.save
			redirect_to "/"
		else
			render "edit"
		end
	end

	def destroy
		@candidat = Candidat.find(id: params[:id])
		@candidat.vote.destroy_all
		@candidat.destroy
		redirect_to "/"
	end

end