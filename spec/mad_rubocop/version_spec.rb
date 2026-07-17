require "spec_helper"

RSpec.describe MadRubocop do
  it "has a semantic version number" do
    expect(MadRubocop::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
  end

  it "matches the version declared in the gemspec" do
    gemspec_path = File.expand_path("../../mad_rubocop.gemspec", __dir__)
    gemspec = Gem::Specification.load(gemspec_path)

    expect(gemspec.version.to_s).to eq(MadRubocop::VERSION)
  end
end
