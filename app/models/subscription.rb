class Subscription < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :stripe_customer

  def save_with_payment(user)
    if valid?
      create_stripe_customer_and_subscription(user)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def create_stripe_customer_and_subscription(user)
    begin
      s_customer = Stripe::Customer.create(description: user.first_name, card: self.stripe_card_token)
      stripe_customer = StripeCustomer.create(object: s_customer.object, description: s_customer.description, livemode: s_customer.livemode, created_timestamp: s_customer.created, reference_id: s_customer.id, user_id: self.user_id)
      customer = Stripe::Customer.retrieve(stripe_customer.reference_id)
      if user.plan_name == "school_closing"
        stripe_charge = Stripe::Charge.create(amount: stripe_charge_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
        user.stripe_charges.create(amount: stripe_charge_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
      else
        subscription = customer.subscriptions.create(:plan => payment_discount)
        user.subscriptions.create(stripe_card_token: subscription.id,plan_name: user.plan_name, stripe_customer_id: stripe_customer.id)
      end
    rescue Exception => e
    end
  end

  def payment_discount
    user  = User.find(self.user_id)

    # this will be updated in upcomming commits
    # if user.coupon.present? && (user.coupon.plan_name =="taps" || user.coupon.plan_name =="queen_city") && user.coupon.plan == "weekly" && user.plan == "weekly" && (user.plan_name == "taps" || user.plan_name == "queen_city")
    #   plan = "W-TAPS-WOR"
    # elsif user.coupon.present?  && (user.coupon.plan_name =="taps" || user.coupon.plan_name =="queen_city") && user.coupon.plan == "weekly" && user.plan == "monthly" && (user.plan_name == "taps" || user.plan_name == "queen_city")
    #   plan = "M-TAPS-WOR"
    # elsif user.coupon.present?  && user.coupon.plan_name == "before_school"  && user.coupon.plan == "weekly" && user.plan == "weekly" && user.plan_name == "before_school"
    #   plan = "W-BSP-WOR"
    # elsif user.coupon.present?  && user.coupon.plan_name == "before_school" && user.coupon.plan == "monthly" && user.plan == "monthly" && user.plan_name == "before_school"
    #   plan = "M-BSP-WOR"
    # elsif user.coupon.present? && user.coupon.plan_name == "after_school" && user.coupon.plan == "weekly" && user.plan == "weekly" && user.plan_name == "after_school"
    #   plan = "W-BSPLAS-WOR"
    # elsif user.coupon.present? && user.coupon.plan_name == "after_school" && user.coupon.plan == "monthly" && user.plan == "monthly" && user.plan_name == "after_school"
    #   plan = "M-BSPIAS-WOR"
    # this will be updated in upcomming commits

    
    if user.plan == "weekly" && user.plan_name == "after_school"
      plan = "5"
    elsif user.plan == "monthly" && user.plan_name == "after_school"
      plan = "6"
    elsif user.plan == "weekly" && user.plan_name == "queen_city"
      plan = "3"
    elsif user.plan == "monthly" && user.plan_name == "queen_city"
      plan = "4"
    elsif user.plan == "weekly" && user.plan_name == "taps"
      plan = "7"
    elsif user.plan == "monthly" && user.plan_name == "taps"
      plan = "8"
    elsif user.plan == "weekly" && user.plan_name == "before_school"
      plan = "1"
    elsif user.plan == "monthly" && user.plan_name == "before_school"
      plan = "2"
    end
    return plan
  end

  def stripe_charge_amount(user)
    user.holiday * 25 * 100
  end

  # def check_subscription(user)
  #   if user.plan_name == "taps"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("taps") ? true : false
  #   elsif user.plan_name == "queen_city"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("queen_city") ? true : false
  #   elsif user.plan_name == "before_school"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("before_school") ? true : false
  #   elsif user.plan_name == "after_school"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("after_school") ? true : false
  #   end
  # end
end
