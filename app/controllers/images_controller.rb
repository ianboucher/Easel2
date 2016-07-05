class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new
  end
end
