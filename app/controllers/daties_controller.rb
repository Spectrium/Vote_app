class DatiesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_user

  def new
    @date = Daty.new
  end

  def create
    @date = Daty.new(debut_propagande: params[:debut_propagande]+params[:debut_propagande_time], fin_propagande: params[:fin_propagande]+params[:fin_propagande_time],
    debut_vote: params[:debut_vote]+params[:debut_vote_time], fin_vote: params[:fin_vote]+params[:fin_vote_time])
    if @date.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def edit
    @date = Daty.find(id: params[:id])
  end

  def update
    @date = Daty.update(debut_propagande: params[:debut_propagande]+params[:debut_propagande_time], fin_propagande: params[:fin_propagande]+params[:fin_propagande_time],
    debut_vote: params[:debut_vote]+params[:debut_vote_time], fin_vote: params[:fin_vote]+params[:fin_vote_time])
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

end
