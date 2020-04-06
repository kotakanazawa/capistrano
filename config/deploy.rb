# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"

set :format_options, truncate: false

set :application, "capistrano"
set :repo_url, "git@github.com:kotakanazawa/capistrano.git"

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"

append :linked_dirs, '.bundle', "log", "tmp/pids", "tmp/cache", "tmp/sockets", 'db/production'
append :linked_files, "config/master.key"

set :bundle_jobs, 2 # 並列数
set :conditionally_migrate, true # db/migrateに差分がなければMigrationをスキップ
