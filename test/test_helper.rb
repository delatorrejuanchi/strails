# frozen_string_literal: true

require "simplecov"
require "simplecov-console"

ROOT = File.expand_path("../", __dir__)
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter,
                                                                SimpleCov::Formatter::Console])

SimpleCov.start("rails") do
  add_filter "lib/strails/version.rb"
end

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path("../db/migrate", __dir__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

module ActiveSupport
  class TestCase
    def assert_has_errors_on(record, *fields)
      missing_fields = record.errors.keys - fields.flatten
      extra_fields = fields.flatten - record.errors.keys
      assert missing_fields.blank?, "#{record.class} has errors on '#{missing_fields.join(', ')}'"
      assert extra_fields.blank?, "#{record.class} doesn't have errors on '#{extra_fields.join(', ')}'"
    end

    def new_params(options = {})
      fixture_name = self.class.name.gsub("::", "").chomp("Test").pluralize.underscore
      default_record = send(fixture_name, "default")

      default_record.attributes.except("id", "created_at", "updated_at").merge(options)
    end
  end
end
