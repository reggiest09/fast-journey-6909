namespace :subscription_plan do
  task :update_subcription_pan=>:environment do
    User.all.each do |user|
    	if user.plan = "weekly"
    		p "************* #{user.plan} ****************"
	    	user.stripe_customers.each do |customer|
	    		begin
		    		cus = Stripe::Customer.retrieve(customer.reference_id)
		    		cus.subscriptions["data"].each do |sub|
		    			time = (Time.at(sub.current_period_start)+14.days).to_i
		    			p "timeeeeeeeeeeeee -------------- #{time} -----------------"
		    			subscription.trial_end = time
		    			subscription.save
		    		end
		    	rescue
		    	end
	    	end
	    end
    end
  end
end