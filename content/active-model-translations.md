# Active model translations

`ActiveModel::Naming` and `ActiveModel::Translations` have model-level
translations that can be applied to both persisted and in-memory models.

```yml
en:
  activemodel:
    models:
      guest: Customer
    attributes:
      guest:
        login: "Handle"
```

This allows access to methods for localized names:

```ruby
@user.model_name.i18n_key           #=> :guest
@user.model_name.human              #=> "Customer"
@user.human_attribute_name("login") # => "Handle"
```
