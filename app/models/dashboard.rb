class Dashboard

  def initialize(user)
    @user = user
  end

  def listed_artworks
    @user.artworks.all
  end

  def purchased_artworks
    @user.purchased_artworks.all
  end
end
