Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false


  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.perform_deliveries = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.log_formatter = ::Logger::Formatter.new

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.logger = Logger.new(STDOUT) 
  config.log_level = :info
  config.active_record.dump_schema_after_migration = false
  # Raise an error on page load if there are pending migrations.
  # config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.i18n.fallbacks = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true
  config.assets.enabled = true

  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  config.assets.precompile += %w( .svg .eot .woff .ttf)

  config.action_mailer.default_url_options = { host: 'localhost', port: '3000'}


  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  config.assets.precompile += %w( .svg .eot .woff .ttf)
  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { host: 'tapseducationandsportsacademy.com'}
  config.action_mailer.delivery_method = :smtp
  # # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'tapseducationandsportsacademy.com',
    :user_name            => ENV["USER_EMAIL"],
    :password             => ENV["USER_PASSWORD"],
    :authentication       => 'plain'
  }

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  # config.action_mailer.default_url_options = { host: 'localhost', port: '3000'}

  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   :address              => "smtp.gmail.com",
  #   :port                 => 587,
  #   :domain               => 'localhost:3000',
  #   :user_name            => "nagendrababu0701@gmail.com",
  #   :password             => "AmmaNana@26",
  #   :authentication       => 'plain',
  #   :enable_starttls_auto  => true
  # }
end
