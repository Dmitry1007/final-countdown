class LinksController < ApplicationController

  def index
    @links = current_user.links
  end

  def create
    @link = Link.create(title: params[:link][:title], url: params[:link][:url], user_id: current_user.id)

    if @link.save
      flash[:success] = "You've created a new link"
      redirect_to :back
    else
      flash[:danger] = "There was problem creating your link, try again"
      redirect_to :back
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(title: params[:link][:title], url: params[:link][:url], user_id: current_user.id)

    if @link.save
      flash[:success] = "Successfully Updated!"
      redirect_to links_path
    else
      flash[:danger] = "Please enter a valid URL"
      render :edit
    end
  end
end
