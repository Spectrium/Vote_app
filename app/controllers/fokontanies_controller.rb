class FokontaniesController < ApplicationController
	before_action :authenticate_user!,only: [:destroy]
	before_action :test_user,only: [:destroy]

  def index
  	@commune = Commune.find_by(id: params[:commune_id])
  end
  def result 
		@fokontany = Fokontany.all
	end
  def destroy
  	@fokontany = Fokontany.find(id: params[:id])
  	@fokontany.recensements.destroy_all
  	@fokontany.destroy
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
