namespace :spec do
  task :clone_structure do
    environments = YAML.load(File.read('config/database.yml'))
    `dropdb #{environments["test"]["database"]}`
    `createdb #{environments["test"]["database"]}`
    `pg_dump -Fc #{environments["development"]["database"]} | pg_restore -d #{environments["test"]["database"]}` 
  end

  desc "Clone structure from development to test and load seed data into test"
  task :prepare => ["spec:clone_structure", :environment] do
    require 'active_record/fixtures'
    ActiveRecord::Base.establish_connection(:test)
    
    # Hack around Rails killing triggers when loading fixtures
    #class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
    #  def supports_disable_referential_integrity?
    #    false
    #  end
    #end    
  end
end
