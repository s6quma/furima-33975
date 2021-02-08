class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price
  end
  validates :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_date_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, message: 'is valid. Input half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
