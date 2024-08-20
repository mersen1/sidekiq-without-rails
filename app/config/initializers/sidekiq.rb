# frozen_string_literal: true

redis_nodes = ENV.fetch('REDIS_NODES').split("\n").map { "redis://#{_1}" }

Sidekiq.logger.info { [redis_nodes, ENV.fetch('REDIS_NODES')] }

Sidekiq.configure_client do |config|
  config.redis = { url: redis_nodes }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_nodes }
end
