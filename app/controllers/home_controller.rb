class HomeController < ApplicationController

  def index
    @date = Daty.last
    @liste = Candidat.all
  end

end
