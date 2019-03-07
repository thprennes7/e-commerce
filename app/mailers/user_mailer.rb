class UserMailer < ApplicationMailer
  default from: 'no-reply@e-commerce.fr'

  def welcome_email(user)
    @user = user
    @url  = 'https://prod-ecommerce-thprennes.herokuapp.com'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def admin_order_email(order)
    @url  = 'https://prod-ecommerce-thprennes.herokuapp.com'
    @items = OrderDetail.where(order_id: order.id)
    @user = User.find(order.user.id)
    @admins = User.where(admin: true)
    @admins.each do |admin|
        @admin = admin
        mail(to: @admin.email, subject: 'Nouvel achat')
      end
  end

  def user_order_email(order)
    @url  = 'https://prod-ecommerce-thprennes.herokuapp.com'
    @items = OrderDetail.where(order_id: order.id)
    @price_total = total_price(@items)
    @user = User.find(order.user.id)
    mail(to: @user.email, subject: 'Votre commande e-commerce')
  end
end
