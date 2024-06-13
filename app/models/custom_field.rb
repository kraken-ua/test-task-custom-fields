class CustomField < ApplicationRecord
  belongs_to :tenant
  has_many :custom_field_values

  validates :name, :field_type, presence: true
  validates :field_type, inclusion: { in: %w[text number single_select multiple_select] }
end
