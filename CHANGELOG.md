# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [4.2.1] - 2026-09-25

### Breaking

- Require Ruby `>= 3.1`. Ruby 2.7 and 3.0 are no longer supported.
- Require RuboCop `~> 1.91.0`, rubocop-rails `~> 2.38.0`, and rubocop-performance `~> 1.27.0`.
  Consumers that pin an older RuboCop must upgrade it to use this release.

### Changed

- Load rubocop-rails and rubocop-performance with `plugins:` instead of `require:`.
- Rename `Naming/PredicateName` to `Naming/PredicatePrefix` in `disabled_cops.yml`
  (renamed in RuboCop 1.88).
- The gem no longer installs a `setup` executable, and packages only the shipped
  configuration, `README.md`, `CHANGELOG.md`, and `LICENSE.txt`.

### Added

- Specs that load the configuration and fail when it references a renamed or removed cop.
- CI on CRuby 3.1, 3.4, and 4.0, JRuby 9.4, and JRuby 10.0.

## [4.2.0.pre1] - 2026-07-20

- Prerelease for RuboCop 1.88 support. Superseded by 4.2.1.

## [4.1.0.rc1] - 2025-04-17

- Release candidate: RuboCop `~> 1.75`, rubocop-performance `~> 1.25`, rubocop-rails `~> 2.31`,
  Ruby `>= 2.7.0`. Superseded by 4.2.1.

## [4.0.0] - 2022-10-21

- RuboCop `~> 1.32.0`, rubocop-performance `~> 1.14.3`, rubocop-rails `~> 2.15.2`.

[4.2.1]: https://github.com/mxenabled/mad_rubocop/compare/v4.2.0.pre1...v4.2.1
[4.2.0.pre1]: https://github.com/mxenabled/mad_rubocop/compare/v4.1.0.rc1...v4.2.0.pre1
[4.1.0.rc1]: https://github.com/mxenabled/mad_rubocop/compare/v4.0.0...v4.1.0.rc1
[4.0.0]: https://github.com/mxenabled/mad_rubocop/compare/v3.64.0...v4.0.0
