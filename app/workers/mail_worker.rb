class MailWorker
  include Sidekiq::Worker

  def perform(attributes)
    # puts "sidekiq start: #{start_date} end: #{end_date}"
    CustomerMailer.crequest(attributes).deliver!
  end
end
