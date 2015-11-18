class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def create
    @link = Link.create!(title: params[:link][:title], url: params[:link][:url], user_id: current_user.id)

    if @link
      flash[:success] = "You've created a new link"
      redirect_to :back
    else
      flash[:danger] = "There was problem creating your link, try again"
      redirect_to :back
    end
  end
end
