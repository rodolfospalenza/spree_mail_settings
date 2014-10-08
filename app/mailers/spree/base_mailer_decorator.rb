Spree::BaseMailer.class_eval do
  def self.method_missing(method_name, *args)
    if action_methods.include?(method_name.to_s)
      SpreeMailSettings::MailerProxy.new(self, method_name, *args)
    else
      super
    end
  end
end

