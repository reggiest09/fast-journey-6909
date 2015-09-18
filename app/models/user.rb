class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_one :coupon
  has_many :stripe_plans
  has_many :stripe_customers
  has_many :stripe_charges

  after_create :send_admin_mail

  def send_admin_mail
    begin
      UserMailer.send_email_to_admin.deliver_now
    rescue Exception => e
    end
  end
end
