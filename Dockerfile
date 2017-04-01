FROM ruby:2.3.4
RUN mkdir -p /builds/CF/lmml-on-rails
WORKDIR  /builds/CF/lmml-on-rails
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -qq && apt-get install -y -qq sqlite3 libsqlite3-dev nodejs
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json package.json
RUN gem install bundler --no-ri --no-rdoc
RUN bundle install --jobs $(nproc)
RUN npm install
RUN rm Gemfile Gemfile.lock package.json
