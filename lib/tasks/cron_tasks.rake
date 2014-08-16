namespace :cron_tasks do
  # rake cron_tasks:check
  desc "rake cron_tasks:check_task"
  task check: :environment do
    log_dir = "#{ Rails.root }/log"
    FileUtils.mkdir_p log_dir

    content = "Cron => Check: #{ Time.new.to_s(:db) }"
    File.open("#{ log_dir }/cron_check.log", 'a') { |f| f.puts content }
    puts content
  end
end
