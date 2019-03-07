class User < ApplicationRecord
  after_create :welcome_send
  has_many :orders
  has_many :carts

  # validates
  #ybo : not possible for the moment
  #ybo  validates :first_name, presence: true
  #ybo  validates :last_name, presence: true
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email non valide" }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
