# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  belongs_to :account, polymorphic: true, optional: true
  validates :email, presence: true

  accepts_nested_attributes_for :account

  def build_account(params)
    self.account = account_type.constantize.new(params)
  end
end
