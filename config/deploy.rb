load 'config/deployment/base'
load 'config/deployment/nginx'
load 'config/deployment/unicorn'

role :web, "149.154.159.87"
role :app, "149.154.159.87"
role :db,  "149.154.159.87", primary: true

set :application, "rails-capistrano-example"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git@github.com:mjaros/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy:restart", "deploy:cleanup"