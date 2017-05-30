desc 'Create tags with exuberant-ctags'
task :tags do
  `ctags -R --extra=+f --languages=ruby \
            --exclude=.git --exclude=log --exclude='*.js' \
            . $(bundle list --paths)`
end
