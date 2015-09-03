set :application, 'crashbreak'
set :repo_url, 'git@github.com:crashbreak/rails-example.git'
set :deploy_to, '/home/ubuntu/apps/crashbreak'

role :app, %w{ubuntu@52.88.49.26}
role :web, %w{ubuntu@52.88.49.26}
role :db,  %w{ubuntu@52.88.49.26}
