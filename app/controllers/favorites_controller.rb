class FavoritesController < ApplicationController

# before_action :set_favoritable_type

  def create
    favorite = current_user.favorites.create(favoritable: params[:favoritable])

    if favorite.save
      flash[:notice] = "Artwork favorited"
    else
      flash[:notice] = "Favoriting failed"
    end
    redirect_to @favoritable
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Artwork unfavorited"
    else
      flash[:notice] = "Unfavoriting failed"
    end
    redirect_to @favoritable
  end

  def set_favoritable_type
    binding.pry
    if params.has_key?("artwork_id")
      @favoritable = Artwork.find(params[:artwork_id])
    else
      @favoritable = Profile.find(params[:profile_id])
    end
  end
end
