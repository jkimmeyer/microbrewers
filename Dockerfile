FROM ruby:3.0.3-slim
LABEL maintainer "Johannes Kimmeyer"

# Debian/Apt dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    dirmngr \
    git \
    gpg \
    less \
    libicu-dev \
    libnss3 \
    libpq-dev \
    postgresql-client \
    tar \
    xz-utils \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# enable UTF-8 locale, fixes many Unicode issues
ENV LANG=C.UTF-8

# Set default / system time zone to Europe/Berlin
ENV TZ=Europe/Berlin

# Install current Bundler
RUN gem update --system && gem install bundler

# Application will run as 'nonroot' user without root privileges
RUN adduser --shell /bin/bash --home /app --disabled-password nonroot
USER nonroot
WORKDIR /app

# Install asdf version manager (can be used to install Node and other language dependencies)
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile
ENV PATH="${PATH}:/app/.asdf/shims:/app/.asdf/bin"
COPY --chown=nonroot .tool-versions ./

# ARGs can be overridden at image build time through --build-arg
ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV:-production}
ARG GIT_REV
ENV GIT_REV=${GIT_REV:-unknown}
ARG BUNDLE_WITHOUT="development test"
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=enabeld
ENV SECRET_KEY_BASE=8efd47831ad2a91195100d14a8b20df7e1d3427fa2f57fa1855a59fb2c499ef440fff870e3bc586eeba2f4ec4a1f8b348dcd1486168dafa1140ed4cc0f2f05be


# bundle install ('deployment' here means bundling to vendor/bundle and erroring out when Gemfile.lock would change)
COPY --chown=nonroot Gemfile Gemfile.lock ./
RUN bundle config set deployment 'true' \
    && bundle install \
      --jobs 5 \
      --retry 3

# Copy all the rest of the application
COPY --chown=nonroot . ./

# Run the web server by default and expose its port
EXPOSE 3000
CMD ["bundle", "exec", "puma"]
