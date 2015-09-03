Crashbreak.configure do |config|
  config.api_key =  ENV['CRASHBREAK_TOKEN']

  config.exception_notifier = Crashbreak::ForkExceptionNotifier.new

  config.error_serializers = [Crashbreak::DefaultSummaryFormatter.new, Crashbreak::EnvironmentVariablesFormatter.new]

  config.dumpers = [Crashbreak::RequestDumper.new, Crashbreak::DatabaseDumper.new]

  config.dumper_options = {
      aws_bucket_name: 'cb-test-app',
      aws_region: 'us-east-1',
  }

  config.ignored_environments = []

  # Setup for minitest (default is rspec)
  config.request_spec_run_command = 'rake test TEST='
  config.request_spec_template_path = "#{Crashbreak.root}/lib/generators/crashbreak/templates/minitest_test.rb"
end

Crashbreak::PredefinedSettings.postgresql("crashbreak_rails_example_#{Rails.env}")