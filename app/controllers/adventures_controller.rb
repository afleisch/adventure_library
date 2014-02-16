class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
  end

  def new
    @adventure = Adventure.new
    guid = SecureRandom.urlsafe_base64(10)
  end

  def create
    new_adventure = params.require(:adventure).permit(:title, :author, :guid, :pages_attributes=>[:name, :text])
    adventure = Adventure.create(new_adventure)
    redirect_to adventure
  end

  def show
    adv_id = params[:id]
    @adventure = Adventure.find(adv_id)
    pages = @adventure.pages
    @start = pages.find_by name: "start"
  end




end
