FROM ruby:2.2.7
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron vim

ENV APP_HOME /weather_me

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install
ADD . $APP_HOME