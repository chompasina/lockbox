class Api::V1::LinkTagsController < ApplicationController
  def destroy
    link_tag = LinkTag.find(params[:id])
    if link_tag.destroy
      render json: {message: "deleted"}
    end
  end
end