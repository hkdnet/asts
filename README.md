# Asts

Extract all abstract syntax trees from your project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'asts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install asts

## Usage

```ruby
Asts.configure do |config|
 config.dir = 'path/to/your/project'
end

Asts.extract # { "file1.rb" => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-3:3>, "file2.rb" => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-3:3> }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hkdnet/asts.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
