# frozen_string_literal: true

redis_url = "redis://#{ENV.fetch('REDIS_URL')}"

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end
