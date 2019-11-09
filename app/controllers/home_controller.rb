class HomeController < ApplicationController

  def index
  	@date = Daty.last
  end

end
