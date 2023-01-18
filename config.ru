# frozen_string_literal: true

require 'sidekiq/web'
require 'rack/session'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
end

# client = Sidekiq::Client.new
# 1_000.times { client.push('class' => 'SampleWorker', 'args' => [], 'queue' => 'low') }

secret_key = SecureRandom.hex(32)
use Rack::Session::Cookie, secret: secret_key, same_site: true, max_age: 86_400
run Sidekiq::Web
