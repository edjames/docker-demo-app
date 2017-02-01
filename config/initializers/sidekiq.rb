Sidekiq.configure_server do |config|
  config.redis = {
    url: Settings.redis_url
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: Settings.redis_url
  }
end

require 'sidekiq/scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(
      File.join(Rails.root, 'config/sidekiq-schedule.yml')
    )
    Sidekiq::Scheduler.reload_schedule!
  end
end
