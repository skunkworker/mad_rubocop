# MadRubocop

[![CI](https://github.com/mxenabled/mad_rubocop/actions/workflows/ci.yml/badge.svg)](https://github.com/mxenabled/mad_rubocop/actions/workflows/ci.yml)

Custom RuboCop yml files to modify the cops enforced by RuboCop.

Built on RuboCop `~> 1.88`, rubocop-rails `~> 2.35`, and rubocop-performance `~> 1.26`. Requires Ruby `>= 3.1`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mad_rubocop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mad_rubocop

Add this to your project .rubocop.yml file:

```yml
inherit_gem:
  mad_rubocop: .rubocop.yml
```

NOTE: The `Exclude` setting on cops that only ignore certain files or directories cannot be set by MadRubocop.


## Development

After checking out the repo, run `bin/setup` to install dependencies.

Run the test suite with `bundle exec rake spec`. The specs validate the shipped configuration against the installed RuboCop — they confirm the config loads, the rubocop-rails and rubocop-performance plugins are present, and every referenced cop still exists (catching cops that a RuboCop upgrade renames or removes).

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mxenabled/mad_rubocop.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

