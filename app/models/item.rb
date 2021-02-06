class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_date_id, numericality: { other_than: 1 }
end
