class Artwork < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable, dependent: :destroy
  # accepts_attachments_for :images, attachment: :file, append: true
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
