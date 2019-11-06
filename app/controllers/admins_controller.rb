class AdminsController < ApplicationController

	def index
		
	end

	def show
		
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(name: params[:name], email: params[:email], password: params[:password])
		@region = Region.create(name: params[:region_name])
		@commune = Commune.create(name: params[:commune_name], region: @region)
		@fokontany = Fokontany.create(name: params[:fokontany_name], commune: @commune)
		@admin.region = @region
		@admin.commune = @commune
		@admin.fokontany = @fokontany
		if @admin.save
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
