class FavoritesController < ApplicationController


  def create
    favorite = Favorite.new(favorite_params)
    favorite.user = current_user

    if favorite.save
      flash[:notice] = "#{favorite.favoritable.class.to_s} favorited"
    else
      flash[:notice] = "Favoriting failed"
    end
    redirect_to :back
  end

  def destroy
    favorite = Favorite.find(params[:id])

    if favorite.destroy
      flash[:notice] = "#{favorite.favoritable.class.to_s} unfavorited"
    else
      flash[:notice] = "Unfavoriting failed"
    end
    redirect_to :back
  end

  # def set_favoritable_type
  #   binding.pry
  #   if params.has_key?("artwork_id")
  #     @favoritable = Artwork.find(params[:artwork_id])
  #   else
  #     @favoritable = Profile.find(params[:profile_id])
  #   end
  # end

  private

  def favorite_params
    params.require(:favorite).permit(:favoritable_id, :favoritable_type)
  end
end
