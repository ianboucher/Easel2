class Artwork < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy#, as: :imageable
  # accepts_attachments_for :images, attachment: :file
  accepts_nested_attributes_for :images
end
