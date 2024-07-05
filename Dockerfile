FROM ruby:2.6.10

RUN apt-get update -qq && apt-get install -y \
	build-essential \
	libpq-dev

WORKDIR /opt/redmine
COPY . /opt/redmine

RUN gem install bundler:2.2.29
RUN bundle install --without development test
EXPOSE 80
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-e", "production"]
