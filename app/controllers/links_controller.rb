class LinksController < ApplicationController

  def index
    if current_user.nil?
      flash[:danger] = "Nice Try Wise Guy"
      redirect_to root_path
    else
      @links = current_user.links
    end
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
