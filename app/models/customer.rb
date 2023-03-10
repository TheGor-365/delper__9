class Customer < ApplicationRecord
  # after_create :send_admin_mail

  # def send_admin_mail
  #   CustomerMailer.send_welcome_email(self).deliver_later
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
