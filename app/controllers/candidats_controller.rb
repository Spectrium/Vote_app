class CandidatsController < ApplicationController
	before_action :authenticate_user!,except: [:index]
	before_action :test_user,except: [:index]

	def index
		@candidat = Candidat.all
	end

	def show
		@candidat = Candidat.find(params[:id])
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
		@candidat = Candidat.find(params[:id])
	end

	def update
		@candidat = Candidat.find(params[:id])
		@candidat.update(full_name: params[:full_name], parti: params[:parti], description: params[:description])
		redirect_to "/"
	end

	def destroy
		@candidat = Candidat.find(params[:id])
		@candidat.votes.destroy_all
		@candidat.destroy
		redirect_to "/"
	end

	private
	
	def test_user
		@user = User.all
		val = 0
		@user.each do |user|
			if current_user == user
				val = 1
				break
			else
				val = 0
			end
		end
		if val == 1
			return true
		else
			redirect_to root_path
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