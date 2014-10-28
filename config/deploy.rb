# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'trampolim'
set :repo_url, 'git@github.com:bahartmann/trampolim.git'

set :deploy_to, '/srv/www/trampolim'

set :scm, :git
set :branch, 'production'

set :pty, true

namespace :deploy do
 desc 'Restart application'
 task :restart do
   on roles(:app, :web), in: :sequence, wait: 5 do
     # Restarts Phusion Passenger
     execute :touch, release_path.join('tmp/restart.txt')
   end
 end

 after :publishing, :restart
end

