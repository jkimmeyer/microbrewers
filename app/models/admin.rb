class Admin < ApplicationRecord
  has_one :user, as: :account, dependent: :destroy
end
