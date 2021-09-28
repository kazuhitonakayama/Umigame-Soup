FROM ruby:2.6.2
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

WORKDIR /Umigame-Soup

COPY Gemfile /Umigame-Soup/Gemfile
COPY Gemfile.lock /Umigame-Soup/Gemfile.lock

RUN gem install bundler && bundle install && bundle update

COPY . /Umigame-Soup
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]