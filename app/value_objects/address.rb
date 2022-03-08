class Address
  include ActiveModel::Validations
  validates :street, :house_number, :postal_code, :city, presence: true

  attr_reader :street, :house_number, :postal_code, :city, :country

  def initialize(street:, postal_code:, city:, house_number:, country: nil)
    @street = street
    @house_number = house_number
    @postal_code = postal_code
    @city = city
    @country = country
  end

  def to_s
    address = "#{street} #{house_number}, #{postal_code} #{city}"
    address += ", #{country}" if country.present?
    address
  end
end
