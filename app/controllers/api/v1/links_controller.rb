class Api::V1::LinksController < ApplicationController
  respond_to :json

  def update
    link = Link.find(params[:id])
    link.update(read: !link.read)
    respond_with link
  end

  def index
    respond_with current_user.links
  end
end
