class Tenant < ApplicationRecord
  has_many :users
  has_many :custom_fields

  validates :name, presence: true
end
