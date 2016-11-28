class Api::V1::LinksController < ApplicationController
  respond_to :html, :json
  
  def index
    respond_with Link.all
  end
  
  def show
    respond_with Link.find_by(id: params[:id])
  end
  
  def update
    respond_with Link.update(params[:id], link_params), location: nil
  end
  
  def create
    respond_with Link.create(link_params), location: nil
  end
  
  def destroy
    respond_with Link.destroy(params[:id])
  end
  
  private
  
    def link_params
      params.permit(:read, :title, :url, :id)
    end
end