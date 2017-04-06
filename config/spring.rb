%w[
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
].each { |path| Spring.watch(path) }

Spring.watch 'config/settings.yml'
Spring.watch 'config/settings/development.yml'
Spring.watch 'config/settings/staging.yml'
Spring.watch 'config/settings/production.yml'
