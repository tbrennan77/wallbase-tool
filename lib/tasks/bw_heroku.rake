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
      puts "Checking if database 'product_chart' exists..."
      if system('psql -l | grep product_chart')
        drop = system('dropdb product_chart')
        puts "Database 'product_chart' exists. Dropping database 'product_chart'"
      else
        puts "Database 'product_chart' does not exist."
        drop = true
      end

      if drop 
        if system('createdb product_chart')
          puts "Created empty database 'product_chart'."
          puts system("pg_restore -d product_chart #{latest_backup}")
        else
          puts "Could not create database 'product_chart'"
          puts "Quiting..."
        end
      else
        puts "Unable to drop database 'product_chart'. Do you have any processes still connected to it?"
        puts "Quiting..."
      end
    end
  
    desc "Create a backup and download the url"
    task :all => [:create, :download]
  end

end