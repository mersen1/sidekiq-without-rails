FROM ruby:3.0.3

RUN apt-get update

RUN mkdir /sidekiq-without-rails
WORKDIR /sidekiq-without-rails
COPY Gemfile /sidekiq-without-rails/Gemfile
COPY Gemfile.lock /sidekiq-without-rails/Gemfile.lock
RUN bundle install
COPY . /sidekiq-without-rails

CMD bundle exec sidekiq -r ./app/config/application.rb -C ./app/config/sidekiq.yml
