# Miyagi

This is a spaced-repetition based helper that will print a set of helpful hints
and teachings to your terminal.

This is created specifically for juniors at [InHouse](https://inhouse.work).
Eventually its planned to make this more customizable.

## Installation

Install the gem and add to the application's Gemfile by executing:

```ruby
gem "miyagi", github: "inhouse-work/miyagi", branch: :master
```

## Usage

In your `rails_helper` you can add an `after(:suite)` hook to add hints after
each `bin/rspec` run:

```ruby
RSpec.configure do |config|
  config.after(:suite) do
    content = Miyagi.teach
    next unless content

    puts "\n#{content}"
  end
end
```

You can configure the path Miyagi will use to remember what you have already
seen by setting the `memory_path`

```ruby
Miyagi.memory_path = Pathname.new("/home/you/.miyagi/something.txt")
```

By default it will use `~/.miyagi/memory.txt`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/inhouse-work/miyagi.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
