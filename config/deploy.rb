set :application, "tasktrack"

require 'bundler/capistrano'
require 'capistrano-unicorn'
require 'rvm/capistrano'

server '78.46.73.243:2000', :web, :app, :db, primary: true

set :user, 'deployer'
set :use_sudo, false

set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

set :branch, 'master'
set :rails_env, 'production'
set :deploy_via, :remote_cache
set :keep_releases, 5
set :repository,  "git@github.com:RacoonsGroup/TimeTrack.git"
set :scm, :git

set :deploy_to, "/home/deployer/#{application}"
set :current_path, "#{deploy_to}/current"

set :unicorn_conf_path, "#{current_path}/config/unicorn/production.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

set :normalize_asset_timestamps, false

set :rvm_ruby_string, '1.9.3-p327'
set :rvm_type, 'user'
set :rvm_path, '/home/deployer/.rvm/'
set :rvm_bin_path, '/home/deployer/.rvm/bin'

namespace :deploy do
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system/ #{release_path}/public/system"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    run "ln -nfs #{shared_path}/log #{release_path}/log"
  end
end


before 'deploy:migrate', 'deploy:symlink_shared'
after 'bundle:install', 'deploy:migrate'

after 'deploy:restart', 'unicorn:reload'
after 'deploy:restart', 'unicorn:restart'

require './config/boot'