require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data was lost)'
  end

  desc 'destructive upgrade test db'
  task :auto_migrate_test do
    RAKE_ENV='test'
    DataMapper.auto_upgrade!
    puts 'Auto-migrate complete (data was lost)'
  end
end
