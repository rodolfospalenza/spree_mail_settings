module SpreeMailSettings
  class MailerProxy
    def initialize(mailer_class, method_name, *args)
      @mailer_class = mailer_class
      @method_name = method_name
      *@args = *args
    end

    def deliver
      SpreeMailSettings::MailerWorker.perform_async(@mailer_class.to_s, @method_name, @args)
    end

    def actual_message
      @actual_message ||= @mailer_class.send(:new, @method_name, *@args).message
    end

    def deliver!
      actual_message.deliver
    end

    def method_missing(method_name, *args)
      actual_message.send(method_name, *args)
    end
  end
end
