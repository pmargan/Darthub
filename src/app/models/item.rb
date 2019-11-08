class Item < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :orders
  has_one_attached :image
end
