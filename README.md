# MadRubocop

[![CI](https://github.com/mxenabled/mad_rubocop/actions/workflows/ci.yml/badge.svg)](https://github.com/mxenabled/mad_rubocop/actions/workflows/ci.yml)

Custom RuboCop yml files to modify the cops enforced by RuboCop, shared across projects.

Built on RuboCop `~> 1.88`, rubocop-rails `~> 2.35`, and rubocop-performance `~> 1.26`. Requires Ruby `>= 3.1`.

## What's in the box

This gem ships configuration only — no Ruby code. Consumers inherit three files:

- `.rubocop.yml` — the entry point. Loads the `rubocop-rails` and `rubocop-performance` plugins, inherits the two files below, and sets `AllCops` defaults (`NewCops: disable`, so cops added in a RuboCop upgrade stay off until explicitly enabled here).
- `lib/disabled_cops.yml` — cops turned off, either as permanent house style or because the codebase isn't ready for them.
- `lib/modified_cops.yml` — cops kept on but configured to a non-default style (e.g. `hash_rockets`, `double_quotes`, outdented access modifiers).

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

### Upgrading RuboCop

Keeping the pinned RuboCop (and its plugins) current is the main maintenance task. The workflow:

1. Bump the version constraints for `rubocop`, `rubocop-rails`, and/or `rubocop-performance` in `mad_rubocop.gemspec`.
2. Run `bundle update rubocop rubocop-rails rubocop-performance`.
3. Run `bundle exec rake spec`. The suite fails if the config references a cop that the new RuboCop **renamed or removed** — the failure message names the offending cop.
4. For each failure, update the cop name in `lib/disabled_cops.yml` / `lib/modified_cops.yml` (or drop it if the cop no longer exists).
5. Because `NewCops` is disabled, cops **added** in the upgrade are off by default. Review `rubocop --show-cops` (or the release notes) and add any you want to disable/configure.
6. Bump `MadRubocop::VERSION` in `version.rb`, note the change, and release.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mxenabled/mad_rubocop.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

