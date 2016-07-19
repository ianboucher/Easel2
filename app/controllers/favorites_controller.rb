class FavoritesController < ApplicationController

# before_action :set_favoritable_type

  def create
    favorite = current_user.favorites.build(favorite_params)

    if favorite.save
      flash[:notice] = "#{favorite.favoritable_type} favorited"
    else
      flash[:notice] = "Favoriting failed"
    end
    redirect_to :back
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "#{favorite.favoritable_type} unfavorited"
    else
      flash[:notice] = "Unfavoriting failed"
    end
    redirect_to :back
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favoritable_id, :favoritable_type)
  end
end
