class ImagesController < ApplicationController

  def update
    # use 'acts_as_list' gem helper 'insert_at' to update image position
    image = Image.find(params[:id])
    image.insert_at(params[:image][:position].to_i)
  end
end
