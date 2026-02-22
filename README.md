# SleeperFF

A Ruby toolkit for the Sleeper Fantasy Football API. This gem provides a simple way to interact with Sleeper's API endpoints.

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

### Leagues

```ruby
# Get all leagues for a user in a season
leagues = client.user_leagues("username", 2023)

# Get a specific league
league = client.league("league_id")

# Get all rosters in a league
rosters = client.league_rosters("league_id")

# Get all users in a league
users = client.league_users("league_id")

# Get all drafts for a league
drafts = client.league_drafts("league_id")
# or via the league object
drafts = league.drafts
```

You can access various attributes on the returned objects:

```ruby
# League attributes
league.name          # => "My Fantasy League"
league.season        # => "2023"
league.settings      # => { scoring_settings: {...}, roster_settings: {...} }
league.roster_positions  # => ["QB", "RB", "WR", "TE", "FLEX", "BN", ...]

# Roster attributes
roster.owner_id      # => "user_id"
roster.players       # => ["player_id1", "player_id2", ...]
roster.starters      # => ["player_id1", "player_id2", ...]
roster.settings      # => { wins: 10, losses: 4, ... }
```

### Drafts

```ruby
# Get all drafts for a user in a season
drafts = client.user_drafts("user_id", 2023)

# Get a specific draft
draft = client.draft("draft_id")

# Get all picks in a draft
picks = client.draft_picks("draft_id")
# or via the draft object
picks = draft.picks

# Get all traded picks in a draft
traded_picks = client.draft_traded_picks("draft_id")
# or via the draft object
traded_picks = draft.traded_picks
```

You can access various attributes on draft objects:

```ruby
# Draft attributes
draft.draft_id    # => "917001170459361281"
draft.league_id   # => "917001170459361280"
draft.type        # => "snake"
draft.status      # => "complete"
draft.season      # => "2023"
draft.settings    # => { teams: 12, rounds: 15, ... }
draft.draft_order # => { "user_id" => slot, ... }

# Pick attributes
pick.player_id    # => "4046"
pick.picked_by    # => "user_id"
pick.round        # => 1
pick.pick_no      # => 1
pick.metadata     # => { first_name: "Kareem", last_name: "Hunt", ... }

# Traded pick attributes
traded_pick.season            # => "2023"
traded_pick.round             # => 3
traded_pick.roster_id         # => 1
traded_pick.previous_owner_id # => 3
traded_pick.owner_id          # => 5
```

### Players

```ruby
# Fetch all NFL players (response is ~5MB, cache locally and call sparingly)
players = client.players

# Get trending players by add or drop activity
trending = client.trending_players("add")
trending = client.trending_players("drop")

# Optional parameters
trending = client.trending_players("add", lookback_hours: 48, limit: 10)
```

```ruby
# Trending player attributes
trending.first.player_id  # => "4046"
trending.first.count      # => 1842
```

More endpoints coming soon:
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
