class Product < ApplicationRecord
  has_onr_attached :featured_image
  has_rich_text :description
  validates :name, presence: true
end
