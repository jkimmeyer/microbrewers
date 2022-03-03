class Brewery < ApplicationRecord
  has_one :user, as: :account, required: true, dependent: :destroy
end
