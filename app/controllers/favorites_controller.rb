class FavoritesController < ApplicationController
  def create
    @artwork = Artwork.find(params[:artwork_id])
    favorite = current_user.favorites.build(artwork: @artwork)

    if favorite.save
      flash[:notice] = "Artwork favorited"
    else
      flash[:notice] = "Favoriting failed"
    end
    redirect_to @artwork
  end

  def destroy
    @artwork = Artwork.find(params[:artwork_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Artwork unfavorited"
    else
      flash[:notice] = "Unfavoriting failed"
    end
    redirect_to @artwork
  end
end
