class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :block_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block_number
    validates :phone_number, numericality: { only_integer: true, message: 'is valid. Input half-with number' }
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank"}

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end