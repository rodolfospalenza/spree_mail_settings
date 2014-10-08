module SpreeMailSettings
  class MailerWorker
    include Sidekiq::Worker
    sidekiq_options queue: "mailer", retry: 0, backtrace: true

    def perform(mailer_class, action, params)
      mailer_class.constantize.send(action, *params).deliver!
    end
  end
end
