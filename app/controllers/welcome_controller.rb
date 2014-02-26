class WelcomeController < ApplicationController
  def index
    @capoeirists = Capoeirist.paginate :page => params[:page], :per_page => 20
  end
end
