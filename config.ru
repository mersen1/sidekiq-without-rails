# frozen_string_literal: true

require 'sidekiq/web'
require 'rack/session'

redis_url = "redis://#{ENV.fetch('REDIS_URL')}"

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

secret = SecureRandom.hex(32)
use Rack::Session::Cookie, secret:, same_site: true, max_age: 86_400

run Sidekiq::Web
