# frozen_string_literal: true

class SampleWorker # rubocop:disable Style/Documentation
  include Sidekiq::Job

  def perform
    sleep 1
  end
end
