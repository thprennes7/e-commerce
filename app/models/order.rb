class Order < ApplicationRecord
  after_create :admin_order_send
  after_create :user_order_send
  belongs_to :user
  has_many :order_details
  has_many :items, through: :order_details


  private

  def admin_order_send
    UserMailer.admin_order_email(self).deliver_now
  end

  def user_order_send
    UserMailer.user_order_email(self).deliver_now
  end

end
