Release a new version of the sleeper_ff gem to RubyGems.

Steps:
1. Ask the user what the new version number should be if not provided as an argument
2. Update `lib/sleeper_ff/version.rb` with the new version
3. Run `bundle exec rspec` to confirm all tests pass before releasing
4. Commit the version bump with message "bump version to X.X.X"
5. Run `bundle exec rake release` to build the gem, create a git tag, push commits and tag, and publish to RubyGems
