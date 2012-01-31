class PaymentMethod::MoneyTransfer< PaymentMethod
  preference :cin, :string
  preference :cineur, :string
  preference :abi, :string
  preference :cab, :string
	preference :iban, :string
	preference :beneficiary, :string
  preference :bank, :string
  preference :agency, :string
  preference :account_number, :string
  preference :send_email, :boolean
  preference :from_email, :string
  # To change this template use File | Settings | File Templates.

  def actions
    %w{capture void}
  end

  # Indicates whether its possible to capture the payment
  def can_capture?(payment)
    ['checkout', 'pending'].include?(payment.state)
  end

  # Indicates whether its possible to void the payment.
  def can_void?(payment)
    payment.state != 'void'
  end

  def capture(payment)
    payment.update_attribute(:state, 'pending') if payment.state == 'checkout'
    payment.complete
    true
  end

  def void(payment)
    payment.update_attribute(:state, 'pending') if payment.state == 'checkout'
    payment.void
    true
  end
end
