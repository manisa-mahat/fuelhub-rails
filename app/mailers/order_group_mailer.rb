class OrderGroupMailer < ApplicationMailer
  def create_order_mailer(consumer, order_group)
    @consumer = consumer
    @order_group = order_group
    mail(
      to: @consumer.email,
      subject: "Order Group Created",
      from: "tester523832@gmail.com"
    ) do |format|
      format.html { render html: order_created_mail.html_safe }
    end
  end

  private
  def order_created_mail
    <<~HTML
      <h1>Hello #{@consumer.name},</h1>
      <p>Your Order Group Has Been Created, #{@consumer.email}</p>
      <p>Order Group ID: #{@order_group.id}</p>
      <p>Feel free to reach us.</p>
      <p>FuelHub, Nepal</p>
    HTML
  end
end
