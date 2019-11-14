class DatiesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :test_user

  def index
    @date = Daty.last
  end

  def new
    @date = Daty.new
  end

  def create
    debut_prop = params[:debut_propagande].to_time + calcul_time(params[:debut_propagande_time])
    fin_prop = params[:fin_propagande].to_time + calcul_time(params[:fin_propagande_time])
    debut_vote = params[:debut_vote].to_time + calcul_time(params[:debut_vote_time])
    fin_vote = params[:fin_vote].to_time + calcul_time(params[:fin_vote_time])
    @date = Daty.new(debut_propagande: debut_prop, fin_propagande: fin_prop,debut_vote: debut_vote, fin_vote: fin_vote)
    if @date.save
      @recensement = Recensement.all
      recense = []
      @recensement.each do |recensement|
        recensement.update(has_voting: false)
      end
      redirect_to "/"
    else
      render "new"
    end
  end

  def edit
    @date = Daty.find(id: params[:id])
  end

  def update
    debut_prop = params[:debut_propagande].to_time + calcul_time(params[:debut_propagande_time])
    fin_prop = params[:fin_propagande].to_time + calcul_time(params[:fin_propagande_time])
    debut_vote = params[:debut_vote].to_time + calcul_time(params[:debut_vote_time])
    fin_vote = params[:fin_vote].to_time + calcul_time(params[:fin_vote_time])
    @date = Daty.new(debut_propagande: debut_prop, fin_propagande: fin_prop,debut_vote: debut_vote, fin_vote: fin_vote)
    if @date.save
      redirect_to "/"
    else
      render "edit"
    end
  end

  def destroy
    @date = Daty.all
    @date.each do |date|
      if date.fin_vote < Time.now
        date.destroy
      end
    end
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
  def calcul_time(valeur)
    time = valeur.to_time.hour * 3600+3 * 3600 + valeur.to_time.min * 60 
    return time
  end

end
