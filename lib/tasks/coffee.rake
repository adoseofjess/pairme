namespace :pair do
  task :coffee => :environment do
    Slack::Post.post Notifier.new.form_message, "#jess-develop2"
  end
end
