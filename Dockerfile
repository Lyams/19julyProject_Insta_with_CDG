FROM ruby:2.7.3-alpine

ARG RAILS_ROOT=/usr/src/app
ARG PACKAGES="vim openssl-dev postgresql-dev build-base curl nodejs yarn less tzdata git postgresql-client bash screen"

RUN apk update && apk upgrade && apk add --update --no-cache $PACKAGES

RUN gem install bundler:2.2.24
ENV BUNDLE_PATH /bundle_cache

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./

RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ADD . /usr/src/app/

CMD ["bundle", "exec", "bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
