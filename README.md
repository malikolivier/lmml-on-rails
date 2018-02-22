# README

## Ruby version: 2.4.3

Suggest to install ruby with ![rvm](https://rvm.io/):

```sh
rvm install 2.4.3
```

## System dependencies

```sh
# This installs git and tzdata (on Ubuntu).
# tzdata should be included as is in most environment
apt install git tzdata
```

Clone the repository with git. Then install the dependencies:

```sh
cd lmml-on-rails
gem install bundler
bundle install
```

You will need to install a `node` to run some tests. It is suggested to manage
your node install with ![nvm](https://github.com/creationix/nvm).

```sh
nvm install 8  # Install latest node version in the 8.x.x branch
npm install
```

# Database initialization

Use sqlite3 for development. Run the following command to clean and reset the
database.

```sh
rails db:clean
```

# How to run the test suite

As a counter-measure against regressions, except for teaspoon (JS tests), all
the following test suite and commands are run during the CI.

- Back-end tests
```sh
rails test
```
- Front-end tests

Run `bundle exec teaspoon` from CLI or go
![there](http://localhost:3000/teaspoon/default) to run tests (broken now).

- Linters

```sh
rubocop    # Run ruby linter
haml-lint  # Run Haml linter
standard   # Run JS linter
```

# Run the server

When all is set up:

```sh
rails server
```

Go to http://localhost:3000 and get started to development.

# App architecture

See HACKING.md
