class RecensementsController < ApplicationController

  def index
  	@recensement = Recensement.all
  end

  def new
  	
  end

  def create
  	@recensement = Recensement.new(full_name: params[:full_name], cin: params[:cin], contact: params[:contact], fokontany: current_user.fokontany)
  	if @recensement.save
  		redirect_to "/recensements"
  	else
  		render "new"
  	end
  end

  def edit
  	@recensement = Recensement.find(params[:id])
  end

  def update
  	@recensement = Recensement.update(full_name: params[:full_name], cin: params[:cin], contact: params[:contact], fokontany: current_user.fokontany)
  	if @recensement.save
  		redirect_to "/recensements"
  	else
  		render "edit"
  	end
  end

  def destroy
  	
  end

end
