require 'bundler/capistrano'
# require 'new_relic/recipes'
load 'deploy/assets'

set :application, "summer_app"
set :repository,  "git@github.com:karthikshambu/summer_app.git"
set :deploy_via, :remote_cache
set :scm, :git

set :scm_username, 'akil_rails'
set :use_sudo, false
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

def aws name
  task name do
    yield
    set :branch, "master"
    set :default_environment, { "PATH" =>
    "/rails/common/ruby-1.9.2-p290/bin:#{deploy_to}/shared/bundle/ruby/1.9.1/bin:$PATH",
    "LD_LIBRARY_PATH" => "/rails/common/oracle/instantclient_11_2",
    "TNS_ADMIN" => "/rails/common/oracle/network/admin" }
    role :app, location
    role :web, location
    role :db, location, :primary => true
    set :user, 'rails'
    ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
  end
end

def aws_staging name
  task name do
    yield
    set :default_environment, { "PATH" =>
    "/rails/common/ruby-1.9.2-p290/bin:#{deploy_to}/shared/bundle/ruby/1.9.1/bin:$PATH",
    "LD_LIBRARY_PATH" => "/rails/common/oracle/instantclient_11_2",
    "TNS_ADMIN" => "/rails/common/oracle/network/admin" }
    role :app, location
    role :web, location
    role :db, location, :primary => true
    set :user, 'rails'
    ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]
  end
end

aws_staging :ec2_staging_summer do
  set :branch, "master"
  set :keep_releases, 1
  set :application, "summer_app"
  set :deploy_to, "/rails/apps/summer_app"
  set :location, "107.23.108.186"
end

aws :ec2_web do
  set :branch, "master"
  set :application, "summer_app"
  set :deploy_to, "/rails/apps/summer_app"
  set :location, "23.21.137.238"
  delayed_job_flag = true
end


after "deploy:assets:precompile", "deploy:update_crontab"
#after "deploy:update", "newrelic:notice_deployment"

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if releases.length <= 1 || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
        # run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:clean_expired}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
  before "deploy:update_crontab" do
    # run "cp #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
    #run "cp #{deploy_to}/shared/newrelic.yml #{release_path}/config/newrelic.yml"
    # run "cp #{deploy_to}/shared/upload.yml #{release_path}/config/upload.yml"
    # run "cp #{deploy_to}/shared/sunspot.yml #{release_path}/config/sunspot.yml"
    # run "cp #{deploy_to}/shared/application.yml #{release_path}/config/application.yml"
    # run "cp #{deploy_to}/shared/setup_mail.rb #{release_path}/config/initializers/setup_mail.rb"
    # run "cp #{deploy_to}/shared/omnicontacts.rb #{release_path}/config/initializers/omnicontacts.rb"
    # run "cp #{deploy_to}/shared/omniauth.rb #{release_path}/config/initializers/omniauth.rb"
    # run "cp #{deploy_to}/shared/schedule.rb #{release_path}/config/schedule.rb"
    # run "cp #{deploy_to}/shared/amazon_ses.rb #{release_path}/config/initializers/amazon_ses.rb"
    # run "cp #{deploy_to}/shared/application.html.haml #{release_path}/app/views/layouts/"
    # run "ln -s #{shared_path}/views #{release_path}/tmp/views"
  end

  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
  #   # run "cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  #   run "cd #{release_path} && bundle exec rackup faye.ru -s thin -E production -D"
  end
  task :start do ; end
  task :stop do ; end

  desc "Restart the delayed_job process"
  task :delayed_job_restart, :roles => :app do
    # run "cd #{current_path} && RAILS_ENV=production script/delayed_job --queue=notifications -i 1 restart"
    # run "cd #{current_path} && RAILS_ENV=production script/delayed_job --queue=replies -i 2 restart"
    # run "cd #{current_path} && RAILS_ENV=production script/delayed_job -queue=default -i 3 restart"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
