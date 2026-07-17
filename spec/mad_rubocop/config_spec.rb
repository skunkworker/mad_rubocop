require "spec_helper"
require "yaml"
require "stringio"
require "rubocop"

# These specs treat the gem's YAML as the unit under test. Because mad_rubocop
# ships nothing but configuration, the most valuable guarantees are that the
# config loads under the pinned RuboCop, that every cop it references still
# exists, and that RuboCop raises no obsolete/removed-cop warnings when it runs.
# A green suite here is what catches upgrades that rename a cop (e.g. the
# Naming/PredicateName -> Naming/PredicatePrefix rename in RuboCop 1.88).
RSpec.describe "MadRubocop configuration" do
  ROOT = File.expand_path("../..", __dir__)
  CONFIG_FILE = File.join(ROOT, ".rubocop.yml")
  COP_CONFIG_FILES = {
    "disabled_cops.yml" => File.join(ROOT, "lib", "disabled_cops.yml"),
    "modified_cops.yml" => File.join(ROOT, "lib", "modified_cops.yml"),
  }.freeze

  # Loading the config also loads the rubocop-rails / rubocop-performance
  # plugins declared under `plugins:`, which registers their cops globally.
  before(:all) do
    RuboCop::ConfigLoader.load_file(CONFIG_FILE)
  end

  def self.cop_names_in(file)
    YAML.safe_load(File.read(file)).keys.select { |key| key.include?("/") }
  end

  it "loads the top-level config without raising" do
    expect { RuboCop::ConfigLoader.load_file(CONFIG_FILE) }.not_to raise_error
  end

  it "loads the rubocop-rails and rubocop-performance plugin cops" do
    departments = RuboCop::Cop::Registry.global.departments.map(&:to_s)

    expect(departments).to include("Rails", "Performance")
  end

  describe "every configured cop is recognized by the installed RuboCop" do
    COP_CONFIG_FILES.each do |label, file|
      context label do
        cop_names_in(file).each do |cop_name|
          it "recognizes #{cop_name}" do
            cop = RuboCop::Cop::Registry.global.find_by_cop_name(cop_name)

            expect(cop).not_to(
              be_nil,
              "#{cop_name} is not a known cop — it may have been renamed, " \
              "removed, or moved to a plugin that is no longer loaded",
            )
          end
        end
      end
    end
  end

  it "runs against a fixture without emitting obsolete/removed-cop warnings" do
    fixture = File.join(ROOT, "spec", "fixtures", "sample.rb")

    captured = StringIO.new
    original_stderr = $stderr
    $stderr = captured
    begin
      RuboCop::CLI.new.run(
        ["--config", CONFIG_FILE, "--force-exclusion", "--no-color", fixture],
      )
    ensure
      $stderr = original_stderr
    end

    expect(captured.string).not_to match(
      /obsolete|has been (removed|renamed|extracted)|unrecognized cop/i,
    )
  end
end
