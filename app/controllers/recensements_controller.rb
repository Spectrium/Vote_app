class RecensementsController < ApplicationController

  before_action :testes, except: [:index, :affiche]

  def index
    @fokontany = Fokontany.find_by(id: params[:fokontany_id])

	  @people = @fokontany.recensements
    
  end

  def affiche
    @recensement = Recensement.all.order(full_name: :asc)
  end

  def show
    @recensements = Recensement.find(params[:id])
    @fokontany = Fokontany.find_by(id: params[:fokontany_id])
    # @recensement = Fokontany.find(id: @recensements.fokontany_id)
  end

  def create
    @recensement = Recensement.all
    @recensement.each do |recensement|
      if recensement.cin == params[:cin]
        flash[:danger] = "Habitant déjà éxisté"
        render "new"
      end
    end
    
  	@recensement = Recensement.new(full_name: params[:full_name], cin: params[:cin],
      pere: params[:nom_pere], mere: params[:nom_mere], logement: params[:logement],
      travail: params[:travail], contact: params[:contact], fokontany: current_admin.fokontany)
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
  	@recensement = Recensement.update(full_name: params[:full_name], cin: params[:cin],
      pere: params[:nom_pere], mere: params[:nom_mere], logement: params[:logement],
      travail: params[:travail], contact: params[:contact], fokontany: current_admin.fokontany)
  	if @recensement.save
  		redirect_to "/recensements"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@recensement = Recensement.find(params[:id])
    @recensement.destroy
    redirect_to root_path
  end
  private
  def testes
    @recensements = Recensement.find_by(id: params[:id])
    if admin_signed_in?
      # if current_admin.fokontany.name == @recensement.fokontany.name
        return true
      else
        redirect_to root_path
      end
  end

end
