CheckoutController.class_eval do

  before_filter :send_email_for_moneytransfer, :only => :update

  private

  def send_email_for_moneytransfer
    return unless params[:state] == "payment"
    @payment_method = PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
    if @payment_method && @payment_method.kind_of?(PaymentMethod::BillingIntegration::MoneyTransfer)
      @order.update_attributes(object_params)
      MoneyTransferMailer.send_money_transfer_instructions(@order.email, @order.number, @payment_method).deliver if @payment_method.preferred_send_email
    end
  end
 
end
