class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]

  has_one :profile
  has_many :artworks
  has_many :purchases
  has_many :purchased_artworks, through: :purchases, source: :artwork
  has_many :favorites, as: :favoritable, dependent: :destroy

end
