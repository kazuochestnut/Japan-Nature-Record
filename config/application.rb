require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JNR
  class Application < Rails::Application
    config.paths.add 'lib', eager_load: true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
   
    # enum日本語表示のため追記
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb.yml}').to_s]

    # field_with_errorsクラスが自動挿入されないようにする
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    
  end
end
