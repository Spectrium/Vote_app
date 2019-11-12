class HomeController < ApplicationController

  def index
    @date = Daty.last
    @liste = Candidat.all
    @total = 0
    @liste.each do |candidat|
    	@total += candidat.votes.count
    end
  end

end
