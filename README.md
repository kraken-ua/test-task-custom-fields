# Custom Fields app

## Assumptions
- Each tenant can define custom fields of different types (text, number, single_select, multiple_select).
- Users belong to a tenant and can set values for custom fields defined by their tenant.
- The API endpoint for updating custom fields for a user is `/users/:id` and expects a `custom_fields` parameter with field IDs and values.

## Setup
1. Clone the repository.
2. Run `bundle install` to install dependencies.
3. Run `rails db:migrate` to create the database schema.
4. Run `rails server` to start the application.

## API Endpoint
### Update User Custom Fields
`PATCH /users/:id`

#### Parameters
- `custom_fields`: Hash of custom field IDs and values.

#### Example Request
```bash
curl -X PATCH "http://localhost:3000/users/1" \
-H "Content-Type: application/json" \
-d '{
  "custom_fields": {
    "1": "Ivan Zaitsev",
    "2": "1234567890"
  }
}'
```

### Optional Features

To make custom fields usable by other entities, you can generalize the custom fields association. This might involve creating a polymorphic association for the `CustomFieldValue` model. This would allow you to associate custom field values with different models, not just users.

**app/models/custom_field_value.rb:**
```ruby
class CustomFieldValue < ApplicationRecord
  belongs_to :customizable, polymorphic: true
  belongs_to :custom_field

  validates :value, presence: true
end
```


And then update associations:

```ruby
class User < ApplicationRecord
  belongs_to :tenant
  has_many :custom_field_values, as: :customizable

  # ... existing methods
end

class CustomField < ApplicationRecord
  belongs_to :tenant
  has_many :custom_field_values, as: :customizable

  # ... existing methods
end
```