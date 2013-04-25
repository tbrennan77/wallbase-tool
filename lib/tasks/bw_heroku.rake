namespace :bw do
  
  namespace :backup do
  
    desc "Create a backup on heroku"
    task :create => :environment do
      puts "Creating backup url.."
      %x{heroku pgbackups:capture}
      print "Create URL at: "
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
      latest_backup = Dir.glob('db/backups/*.dump').last
      puts "Restoring latest backup url..."
      puts "Checking if database 'wallbase_dev' exists..."
      if system('psql -l | grep wallbase_dev')
        drop = system('dropdb wallbase_dev')
        puts "Database 'wallbase_dev' exists. Dropping database 'wallbase_dev'"
      else
        puts "Database 'wallbase_dev' does not exist."
        drop = true
      end

      if drop 
        if system('createdb wallbase_dev')
          puts "Created empty database 'wallbase_dev'."
          puts system("pg_restore -d wallbase_dev #{latest_backup}")
        else
          puts "Could not create database 'wallbase_dev'"
          puts "Quiting..."
        end
      else
        puts "Unable to drop database 'wallbase_dev'. Do you have any processes still connected to it?"
        puts "Quiting..."
      end
    end
  
    desc "Create a backup and download the url"
    task :all => [:create, :download]
  end

end