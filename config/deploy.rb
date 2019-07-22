require 'viget/deployment/rails'

set :application,    'eatandgreet'
set :group_writable, false

set :repository, 'git@github.com:vigetlabs/eat-and-greet.git'
set :branch,     'master'

set :user, 'deploy'

set :slack_url,     'https://hooks.slack.com/services/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'
set :slack_channel, '#interns-19'
set :slack_emoji,   ':fork_and_knife:'

namespace :deploy do
  namespace :configuration do
    desc "Link created configuration to current release"
    task :symlink, except: { no_release: true } do
      run %{rm #{release_path}/config/database.yml}
      run %{ln -nsf "#{shared_path}/config/database.yml" "#{release_path}/config/database.yml"}

      run %{ln -nsf "#{shared_path}/config/master.key" "#{release_path}/config/master.key"}
    end
  end
end
