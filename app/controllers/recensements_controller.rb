class RecensementsController < ApplicationController


  def index
    @fokontany = Fokontany.find_by(id: params[:fokontany_id])

	  @q = @fokontany.recensements.search(params[:q])
    @people = @q.result
  end
  def affiche
    
  end

  def create
    @recensement = Recensement.all
    @recensement.each do |recensement|
      if recensement.cin == params[:cin]
        flash[:danger] = "Habitant déjà éxisté"
        render "new"
      end
    end
    
  	@recensement = Recensement.new(full_name: params[:full_name], cin: params[:cin], contact: params[:contact], fokontany: current_admin.fokontany)
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
  	@recensement = Recensement.update(full_name: params[:full_name], cin: params[:cin], contact: params[:contact], fokontany: current_admin.fokontany)
  	if @recensement.save
  		redirect_to "/recensements"
  	else
  		render "edit"
  	end
  end

  def show
    @recensements = Recensement.find(params[:id])
    @recensement = Fokontany.find(@recensements.fokontany_id)
  end

  def destroy
  	@recensement = Recensement.find(params[:id])
    @recensement.destroy
    redirect_to root_path
  end

end
