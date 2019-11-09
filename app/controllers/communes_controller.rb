class CommunesController < ApplicationController
	before_action :authenticate_user!,only: [:destroy]
	before_action :test_user,only: [:destroy]

	def index
		@region = Region.find(id: params[:id_region])
	end

	def destroy
		@commune = Commune.find(id: params[:id])
		@fokontany = commune.fokontanies.all
		@fokontany.each do |fokontany|
			fokontany.recensements.destroy_all
		end
		commune.fokontanies.destroy
		@commune.destroy
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
end
