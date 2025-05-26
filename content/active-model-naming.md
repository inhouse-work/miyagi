# Active model naming

When you use a path helper like `project_path(project)` how does Rails know that
the path should be `/projects/1`?

It is using `ActiveModel::Naming` to figure out the right name (in this case
`projects`, its table name) and the right parameter for the id which comes from
your `to_param` method.

You can change this in your models:

```
class MyModel < ApplicationModel
  attr_accessor :uuid

  def to_param = uuid
end
```

Now the project would use its `uuid` instead of its `id` (the default).
