class Admin < ApplicationRecord
  has_one :user, as: :account, required: true
end
