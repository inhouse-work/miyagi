# Active model normalization

You can use the `normalizes` class method on any `ApplicationModel` or
`ApplicationRecord`:

```ruby
class User < ApplicationRecord
  normalizes :email, with: -> { it.strip.downcase }
end

user = User.new(email: "HELLO@WORLD.com ")
user.email #=> "hello@world.com"
```

The normalization is applied when the attribute is assigned or updated, and the
normalized value will be persisted to the database. The normalization is also
applied to the corresponding keyword argument of finder methods. This allows
a record to be created and later queried using unnormalized values.
