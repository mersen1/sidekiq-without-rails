FROM ruby:3.3.0-slim

WORKDIR /sidekiq-without-rails

COPY Gemfile /sidekiq-without-rails/Gemfile
COPY Gemfile.lock /sidekiq-without-rails/Gemfile.lock

RUN bundle install

COPY . /sidekiq-without-rails

CMD ["./bin/container/run"]
