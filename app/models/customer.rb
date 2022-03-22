class Customer < ApplicationRecord
  has_one :user, as: :account, dependent: :destroy
end
