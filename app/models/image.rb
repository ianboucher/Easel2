class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attachment :file
  acts_as_list scope: :imageable
  # default_scope { order(:position) }
end
