class Artwork < ActiveRecord::Base
  belongs_to :user
  has_many :images, -> {order(position: :asc)}, as: :imageable, dependent: :destroy
  has_many :purchases
  has_many :favorites, dependent: :destroy
  # accepts_attachments_for :images, attachment: :file, append: true
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  def category_list
    category.join(', ')
  end

  def category_list=(category)
    self.category = category.split(',')
  end
end
