# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('..', 'Gemfile', __dir__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default)

require 'sidekiq'

Dir.glob(File.join(File.dirname(__dir__), 'workers', '**/*_worker.rb')).each do |filename|
  require filename
end
