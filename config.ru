# frozen_string_literal: true

require 'sidekiq/web'
require 'rack/session'

redis_nodes = ENV.fetch('REDIS_NODES').split("\n").map { "redis://#{_1}" }

Sidekiq.logger.info { [redis_nodes, ENV.fetch('REDIS_NODES')] }

Sidekiq.configure_client do |config|
  config.redis = { url: redis_nodes }
end

secret = SecureRandom.hex(32)
use Rack::Session::Cookie, secret:, same_site: true, max_age: 86_400

run Sidekiq::Web
