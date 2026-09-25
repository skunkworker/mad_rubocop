require "spec_helper"

RSpec.describe MadRubocop do
  it "has a MAJOR.MINOR.PATCH version, optionally with a prerelease suffix" do
    expect(Gem::Version.new(MadRubocop::VERSION).release.segments.size).to eq(3)
  end

  it "matches the version declared in the gemspec" do
    gemspec_path = File.expand_path("../../mad_rubocop.gemspec", __dir__)
    gemspec = Gem::Specification.load(gemspec_path)

    expect(gemspec.version.to_s).to eq(MadRubocop::VERSION)
  end
end
