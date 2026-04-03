# frozen_string_literal: true

redis_config = if ENV["REDIS_SENTINELS"]
  sentinels = ENV["REDIS_SENTINELS"].split(",").map do |entry|
    host, port = entry.strip.split(":")
    {host: host, port: (port || 26379).to_i}
  end
  master = ENV.fetch("REDIS_MASTER_NAME", "master")
  {url: "redis://#{master}/0", sentinels: sentinels}
else
  {url: "redis://#{ENV.fetch("REDIS_URL")}"}
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

Sidekiq.configure_server do |config|
  config.redis = redis_config
end
