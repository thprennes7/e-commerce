class Order < ApplicationRecord
  after_create :order_send :send_user_order
  belongs_to :user
  has_many :items, through: :order_detail


private

  def order_send(user, item)
    @item = item
    @user = user
    if @user.is_admin?
      UserMailer.order_email.deliver_now
    end
  end

  def send_user_order(user, item)
    @item = item
    @user = user
    if != @user.is_admin?
      UserMailer.order_user_email.deliver_now
  end
end
