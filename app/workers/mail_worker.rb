class MailWorker
  include Sidekiq::Worker

  def perform(start_date, end_date)
    puts "sidekiq start: #{start_date} end: #{end_date}"

  end
end
