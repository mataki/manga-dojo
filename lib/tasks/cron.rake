require "lib/log_gss"

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  # log size of record for each model to Google SpreadSheet
  opt = [User.count,
         Manga.count]
  LogGss.update(opt)
end
