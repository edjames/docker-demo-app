class TestWorker

  include Sidekiq::Worker

  def perform(raw_data = {})
    data = raw_data.with_indifferent_access
    service_class = data.fetch(:service_class).constantize
    service_class.new.execute
  end

end
