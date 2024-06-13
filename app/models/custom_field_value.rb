class CustomFieldValue < ApplicationRecord
  belongs_to :user
  belongs_to :custom_field

  validates :value, presence: true
end
