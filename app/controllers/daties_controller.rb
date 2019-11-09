class DatiesController < ApplicationController

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

end
