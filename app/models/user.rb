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
  has_many :football_camps
  has_many :children_names
  accepts_nested_attributes_for :football_camps, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :children_names, allow_destroy: true
  serialize :holiday
  serialize :child_name, Array

  after_create :send_admin_mail

  def send_admin_mail
    begin
      UserMailer.send_email_to_admin.deliver_now
    rescue Exception => e
    end
  end

  def self.calculate_plan_name(plan_mode, number_of_child, after_school)
    if plan_mode == "weekly" && number_of_child == "1" && after_school == "after_school"
      plan_name = "AFW1Child"
    elsif plan_mode == "weekly" && number_of_child == "2" && after_school == "after_school"
      plan_name = "AFW2Child"
    elsif plan_mode == "weekly" && number_of_child == "3" && after_school == "after_school"
      plan_name = "AFW3Child"
    elsif plan_mode == "monthly" && number_of_child == "1" && after_school == "after_school"
      plan_name = "AFM1Child"
    elsif plan_mode == "monthly" && number_of_child == "2" && after_school == "after_school"
      plan_name = "AFM2Child"
    elsif plan_mode == "monthly" && number_of_child == "3" && after_school == "after_school"
      plan_name = "AFM3Child"

    elsif plan_mode == "weekly" && number_of_child == "1" && after_school == "before_school_fater_school"
      plan_name = "BAW1Child"
    elsif plan_mode == "weekly" && number_of_child == "2" && after_school == "before_school_fater_school"
      plan_name = "BAW2Child"
    elsif plan_mode == "weekly" && number_of_child == "3" && after_school == "before_school_fater_school"
      plan_name = "BAW3Child"
    elsif plan_mode == "monthly" && number_of_child == "1" && after_school == "before_school_fater_school"
      plan_name = "BAM1Child"
    elsif plan_mode == "monthly" && number_of_child == "2" && after_school == "before_school_fater_school"
      plan_name = "BAM2Child"
    elsif plan_mode == "monthly" && number_of_child == "3" && after_school == "before_school_fater_school"
      plan_name = "BAM3Child"

    elsif plan_mode == "weekly" && number_of_child == "3" && after_school == "before_school_only"
      plan_name = "BW3Child"
    elsif plan_mode == "weekly" && number_of_child == "2" && after_school == "before_school_only"
      plan_name = "BW2Child"
    elsif plan_mode == "weekly" && number_of_child == "1" && after_school == "before_school_only"
      plan_name = "BW1Child"
    elsif plan_mode == "monthly" && number_of_child == "3" && after_school == "before_school_only"
      plan_name = "BM3Child"
    elsif plan_mode == "monthly" && number_of_child == "2" && after_school == "before_school_only"
      plan_name = "BM2Child"
    elsif plan_mode == "monthly" && number_of_child == "1" && after_school == "before_school_only"
      plan_name = "BM1Child"
    else
    end

  end
end
