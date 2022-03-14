class Brewery < ApplicationRecord
  has_one_attached :logo
  has_one :user, as: :account, dependent: :destroy
  validates :name, :description, presence: true

  def address
    return nil if address_data.blank?

    Address.new(
      street: address_data["street"],
      house_number: address_data["house_number"],
      postal_code: address_data["postal_code"],
      city: address_data["city"],
      country: address_data["country"],
    )
  end

  def address=(address)
    address_data["street"] = address.street
    address_data["house_number"] = address.house_number
    address_data["postal_code"] = address.postal_code
    address_data["city"] = address.city
    address_data["country"] = address.country
  end
end
