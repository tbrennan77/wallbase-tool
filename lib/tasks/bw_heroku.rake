DB_CONFIG = Rails.application.config.database_configuration[Rails.env]

namespace :bw do
  
  namespace :backup do
  
    desc "Create a backup on heroku"
    task :create => :environment do
      puts "Creating backup url.."
      %x{heroku pgbackups:capture}
      print "Created URL at: "
      %x{`heroku pgbackups:url`}
      puts "\n"
    end

    desc "Download latest backup url"
    task :download => :environment do
      puts "Downloading latest backup url..."
      %x{wget --output-document db/backups/#{DateTime.now.strftime("%Y%m%d%H%M%S")}.dump `heroku pgbackups:url`}
    end

    desc "Restore latest backup"
    task :restore => :environment do
      puts "Make sure you run 'rake db:drop' and 'rake db:create' before you run a restore."
      latest_backup = Dir.glob('db/backups/*.dump').last
      puts "Restoring to latest backup from heroku..."
      puts `pg_restore -d #{DB_CONFIG['database']} #{latest_backup}`
    end
  
    desc "Create a backup and download the url"
    task :all => [:create, :download]
  end

end