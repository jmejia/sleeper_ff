# SleeperFF

A Ruby toolkit for the Sleeper Fantasy Football API. This gem provides a simple and intuitive way to interact with Sleeper's API endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sleeper_ff'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install sleeper_ff
```

## Usage

### Quick Start

```ruby
# Create a new client
client = SleeperFF.new

# Get user information
user = client.user("username")
puts user.display_name
```

### Configuration

You can configure the client with custom options:

```ruby
# Configure with a custom user agent
client = SleeperFF.new(user_agent: "My App v1.0")

# Or configure globally
SleeperFF.configure do |config|
  config.user_agent = "My App v1.0"
  config.api_endpoint = "https://api.sleeper.app/v1" # default
end
```

### Available Methods

#### Users

```ruby
# Get user by username
user = client.user("username")

# Access user attributes
user.username       # => "username"
user.user_id       # => "123456789"
user.display_name  # => "Display Name"
user.avatar       # => "avatar_url"
```

More endpoints coming soon:
- Leagues
- Rosters
- Players
- Drafts
- Matchups
- Transactions

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmejia/sleeper_ff. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jmejia/sleeper_ff/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SleeperFF project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jmejia/sleeper_ff/blob/main/CODE_OF_CONDUCT.md).
