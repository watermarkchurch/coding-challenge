FROM ruby:3.0.1

# HACK: Needed for debian to provide latest version of postgres client
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' > \
 /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
 apt-key add -

 RUN apt-get update -qq && apt-get install --fix-missing -y \
  postgresql-client-13

# install nodejs & yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -; \
  apt-get update -qq && apt-get install nodejs && \
  npm install --global yarn

RUN gem install bundler -v 2.2.17

RUN mkdir -p /app

ENV BUNDLE_GEMFILE=/app/Gemfile \
  BUNDLE_PATH=/bundle

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN export MAKE="make -j$(nproc)"; bundle install

ADD package.json yarn.lock /app/
ADD . /app
RUN export MAKE="make -j$(nproc)"; yarn install

ENV PATH="/app/bin:${PATH}"
