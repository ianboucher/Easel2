class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile   = Profile.find(params[:id])
    @favorited = Favorite.find_by(favoritable: @profile, user: current_user)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params) # syntax for has_one association

    if @profile.save!
      flash[:notice] = "profile saved"
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Error saving profile"
      redirect_to new_profile_path
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:notice] = "profile updated"
      redirect_to @profile
    else
      flash[:alert] = "Error updating profile"
      redirect_to edit_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :tagline, :statement, :info,
      images_attributes:[:id, :file, :_destroy])
  end
end
