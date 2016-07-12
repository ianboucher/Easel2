class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  # belongs_to :artwork
  attachment :file
end
