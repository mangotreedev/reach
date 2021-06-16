namespace :db do

  desc "Copy production database to local"
  task :copy_production => :environment do

    # Capture & Download latest dump
    system("heroku pg:backups:capture --remote production")
    system("heroku pg:backups:download --remote production")

    # Get user and database name
    config   = Rails.configuration.database_configuration["development"]
    database = config["database"]

    # Import into local
    system("pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{database} latest.dump")

    # Remove temporary datadump
    system("rm latest.dump")
  end

end
