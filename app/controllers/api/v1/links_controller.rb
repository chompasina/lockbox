class Api::V1::LinksController < ApplicationController
  respond_to :json, :html
  
  def index
    links = current_user.links.order(:title)
    resnder json: links
  end
  
  def show
    respond_with Link.find_by(id: params[:id])
  end
  
  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      render json: link
    else 
      render :json => { :errors => link.errors.full_messages }, :status => 422
    end
    # respond_with Link.update(params[:id], link_params), location: nil
  end
  
  def create
    link = Link.new(link_params)
    if link.save
      render json: link
    else 
      render :json => { :errors => link.errors.full_messages }, :status => 422
    end
    # respond_with Link.create(link_params), location: nil
  end
  
  def destroy
    respond_with Link.destroy(params[:id])
  end
  
  private
  
    def link_params
      params.permit(:title, :read, :url, :id, :user_id, :tag_list)
    end
end