class AdminsController < ApplicationController
<<<<<<< HEAD
	
=======
	before_action :authenticate_user!, except: [:edit]
	before_action :test_user,only: [:new,:destroy]


>>>>>>> 24b1c3edeeeba5889fae644c030357e27cf55c4a
	def index
		@admin = Admin.all
	end

	def show
		
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(name: params[:name], email: params[:email], password: params[:password])

		@region = Region.all
		teste = 0
		@region.each do |region|
			if region.name == params[:region_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@region_name = Region.create(name: params[:region_name])
		else
			@region_name = Region.find_by(name: params[:region_name])
		end

		@commune = @region_name.communes.all
		teste = 0
		@commune.each do |commune|
			if commune.name == params[:commune_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@commune_name = Commune.create(name: params[:commune_name], region: @region_name)
		else
			@commune_name = Commune.find_by(name: params[:commune_name])
		end

		@fokontany = @commune_name.fokontanies.all
		teste = 0
		@fokontany.each do |fokontany|
			if fokontany.name == params[:fokontany_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@fokontany_name = Fokontany.create(name: params[:fokontany_name], commune: @commune_name)
			@admin.region = @region_name
			@admin.commune = @commune_name
			@admin.fokontany = @fokontany_name
			if @admin.save
				redirect_to "/"
			else
				render "new"
			end
		else
			flash[:danger] = "Responsable déjà créé"
			redirect_to "/"
		end

	end

	def edit
		@admin = Admin.find(id: params[:id])
	end

	def update
		@admin = Admin.update(name: params[:name], email: params[:email], password: params[:password])

		@region = Region.all
		teste = 0
		@region.each do |region|
			if region.name == params[:region_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@region_name = Region.create(name: params[:region_name])
		else
			@region_name = Region.find_by(name: params[:region_name])
		end

		@commune = @region_name.communes.all
		teste = 0
		@commune.each do |commune|
			if commune.name == params[:commune_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@commune_name = Commune.create(name: params[:commune_name], region: @region_name)
		else
			@commune_name = Commune.find_by(name: params[:commune_name])
		end

		@fokontany = @commune_name.fokontanies.all
		teste = 0
		@fokontany.each do |fokontany|
			if fokontany.name == params[:fokontany_name]
				teste = 1
				break
			else
				teste = 0
			end
		end
		if teste == 0
			@fokontany_name = Fokontany.create(name: params[:fokontany_name], commune: @commune_name)
			@admin.region = @region_name
			@admin.commune = @commune_name
			@admin.fokontany = @fokontany_name
			if @admin.save
				redirect_to "/"
			else
				render "new"
			end
		else
			flash[:danger] = "Responsable déjà créé"
			redirect_to "/"
		end

	end

	def destroy
		@admin = Admin.find(params[:id])
		@admin.destroy
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
end
