class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
