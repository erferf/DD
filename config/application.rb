require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'securerandom'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Theoj
  class Application < Rails::Application

    # Load everything in lib/core-ext
    Dir[Rails.root.join("lib/extensions/**/*.rb")].each {|f| require f}

    require File.join(Rails.root, 'lib/settings')


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.sass.preferred_syntax = :sass
    Rails.application.config.assets.precompile.push( "webcomponentsjs/webcomponents.js" )
    config.i18n.enforce_available_locales = true

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.test_framework  :rspec
      g.integration_tool :rspec
    end

    Rails.configuration.action_mailer.default_options = {
        from: '"The OJ Team" <robot@theoj.org>'
    }

    Rails.configuration.action_mailer.smtp_settings = Settings.smtp_settings if Settings.smtp_settings

  end
end


