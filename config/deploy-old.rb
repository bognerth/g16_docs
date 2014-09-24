require "bundler/capistrano"
set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"

set :application, 'G16Docs'
set :scm, :git
set :repository, 'git://github.com/bognerth/g16_docs.git'
set :branch, "master"

server "188.138.121.50", :web, :app, :db, :primary => true


set :user, "railsadmin"
set :group, "railsadmin"
set :deploy_to, "/var/g16_docs"
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  desc "Restart the app"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Copy the Database.yml file into the latest release"
  task :copy_in_database_yml do
    run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
    run "cp #{shared_path}/config/application.yml #{latest_release}/config/"
    #run "cp #{shared_path}/config/seeds.rb #{latest_release}/db/"
    #run "cp #{shared_path}/config/production.rb #{latest_release}/config/environments/"
    #run "cp #{shared_path}/config/deploy.rb #{latest_release}/config/"
    #run "cp #{previous_release}/db/production.sqlite3 #{latest_release}/db/"
    run "cp -R #{previous_release}/public/uploads/ #{latest_release}/public/uploads/"
  end
end

before "deploy:assets:precompile", "deploy:copy_in_database_yml"
after "deploy", "deploy:migrate"

