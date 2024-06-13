class User < ApplicationRecord
  belongs_to :tenant
  has_many :custom_field_values

  validates :name, presence: true

  # Updates the custom fields for the user.
  # @param custom_fields_params [Hash] Hash of custom field IDs and values
  def update_custom_fields(custom_fields_params)
    custom_fields_params.each do |field_id, value|
      custom_field_value = custom_field_values.find_or_initialize_by(custom_field_id: field_id)
      custom_field_value.update(value: value)
    end
  end
end
