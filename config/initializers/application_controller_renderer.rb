# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']
