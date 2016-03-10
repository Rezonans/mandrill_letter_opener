require 'mandrill'
require 'letter_opener'

module MandrillLetterOpener
  class Engine < ::Rails::Engine
    initializer 'mandrill_letter_opener', group: :all  do |app|
      if config.action_mailer[:delivery_method] == :letter_opener
        MandrillMailer::TemplateMailer.class_eval do
          define_method :deliver do
            opts = {
                from: message['from_email'],
                to: message['to'].map{|m| m['email']}.join(', '),
                subject: message['subject'],
                body: JSON.pretty_generate(message)
            }
            ActionMailer::Base.mail(opts).deliver
          end
          alias_method :deliver_now, :deliver
          alias_method :deliver_later, :deliver
        end
      end
    end
  end
end
