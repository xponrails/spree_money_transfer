class MoneyTransferMailer< ActionMailer::Base
  def send_money_transfer_instructions(email, order_number, payment_method)
    @payment_method = payment_method
    subject = "#{Spree::Config[:site_name]} #{t('money_transfer.payment_instructions')} ##{order_number}"
    mail(:from => @payment_method.preferred_from_email,
         :to => email,
         :subject => subject
    )
  end

end