FROM ruby:3.2.0-slim

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      default-libmysqlclient-dev \
      git \
      imagemagick \
      libpq-dev \
      libvips \
      pkg-config && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.1 && bundle install
COPY . .
RUN chmod +x bin/docker-entrypoint

EXPOSE 3000
ENTRYPOINT ["bin/docker-entrypoint"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
