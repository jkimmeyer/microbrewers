class Brewery < ApplicationRecord
  has_one :user, as: :account, required: true
end
