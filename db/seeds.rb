# Clear existing data
CustomFieldValue.delete_all
CustomField.delete_all
User.delete_all
Tenant.delete_all

# Create Tenants
tenant1 = Tenant.create!(name: 'Tenant One')
tenant2 = Tenant.create!(name: 'Tenant Two')

# Create Users for Tenant One
user1_t1 = User.create!(name: 'Alice', tenant: tenant1)
user2_t1 = User.create!(name: 'Bob', tenant: tenant1)

# Create Users for Tenant Two
user1_t2 = User.create!(name: 'Charlie', tenant: tenant2)
user2_t2 = User.create!(name: 'David', tenant: tenant2)

# Create Custom Fields for Tenant One
field1_t1 = CustomField.create!(name: 'Phone', field_type: 'number', tenant: tenant1)
field2_t1 = CustomField.create!(name: 'Address', field_type: 'text', tenant: tenant1)
field3_t1 = CustomField.create!(name: 'Gender', field_type: 'single_select', tenant: tenant1)

# Create Custom Fields for Tenant Two
field1_t2 = CustomField.create!(name: 'Age', field_type: 'number', tenant: tenant2)
field2_t2 = CustomField.create!(name: 'Hobbies', field_type: 'multiple_select', tenant: tenant2)

# Create Custom Field Values for Users in Tenant One
CustomFieldValue.create!(user: user1_t1, custom_field: field1_t1, value: '1234567890')
CustomFieldValue.create!(user: user1_t1, custom_field: field2_t1, value: '123 Main St')
CustomFieldValue.create!(user: user1_t1, custom_field: field3_t1, value: 'Female')

CustomFieldValue.create!(user: user2_t1, custom_field: field1_t1, value: '0987654321')
CustomFieldValue.create!(user: user2_t1, custom_field: field2_t1, value: '456 Elm St')
CustomFieldValue.create!(user: user2_t1, custom_field: field3_t1, value: 'Male')

# Create Custom Field Values for Users in Tenant Two
CustomFieldValue.create!(user: user1_t2, custom_field: field1_t2, value: '25')
CustomFieldValue.create!(user: user1_t2, custom_field: field2_t2, value: 'Reading, Swimming')

CustomFieldValue.create!(user: user2_t2, custom_field: field1_t2, value: '30')
CustomFieldValue.create!(user: user2_t2, custom_field: field2_t2, value: 'Cooking, Hiking')
