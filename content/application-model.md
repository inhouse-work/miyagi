# Application model initialization

Rails `ActiveModel::Model` class will override the `initialize` method to call
the setters dynamically depending on the keywords or single hash you give it:

```ruby
class MyModel < ApplicationModel
  # We now have the setter name=(value)
  attr_accessor :name
end
```

When you call `MyModel.new(name:)` it will do something like this:

```ruby
class MyModel
  def initialize(**kwawrgs)
    kwargs.each do |key, value|
      send(:"#{key}=", value)
    end
  end
end
```

Which will dynamically call the `name=` setter.
