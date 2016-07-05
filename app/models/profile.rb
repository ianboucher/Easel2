class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable
end
