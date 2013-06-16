DB_CONFIG = Rails.application.config.database_configuration[Rails.env]

namespace :bw do
  
  namespace :backup do
  
    desc "Create a backup on heroku"
    task :create => :environment do
      puts "Creating backup url.."
      capture = %x{heroku pgbackups:capture}
      capture_number = capture.gsub /[^\d\d\d]/, ''
      print "Created URL at: "
      %x{`heroku pgbackups:url`}
      puts "\n"
      puts "Downloading latest backup url..."
      %x{curl -o db/backups/#{DateTime.now.strftime("%Y%m%d%H%M%S")}.dump `heroku pgbackups:url`}
      puts "Removing backup... b#{capture_number[0..2]}"
      delete_results = %x{`heroku pgbackups:destroy b#{capture_number[0..2]}`}
      puts delete_results
      puts "Cleaning up backups..."
      %x{ls -1dt db/backups/* | tail -n +6 |  xargs rm -rf}
    end

    desc "Download latest backup url"
    task :download => :environment do
      puts "Downloading latest backup url..."
      %x{curl -o db/backups/#{DateTime.now.strftime("%Y%m%d%H%M%S")}.dump `heroku pgbackups:url`}
    end

    desc "Restore latest backup"
    task :restore => :environment do
      puts "Make sure you run 'rake db:drop' and 'rake db:create' before you run a restore."
      latest_backup = Dir.glob('db/backups/*.dump').last
      puts "Restoring to latest backup from heroku..."
      puts `pg_restore -d #{DB_CONFIG['database']} #{latest_backup}`
    end    
  end

end

# Use this in the future for creating a restore script
# pg_restore --verbose --clean --no-acl --o-owner -h localhost -d wallbase_dev db/backups/20130613131725.dump