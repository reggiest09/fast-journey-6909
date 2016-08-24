class AfterSchoolRegistrationsController < ApplicationController
	 layout 'application'
	before_action :authenticate_user!
	def index
		@user = current_user
		@user.update_attributes(:plan_name => params[:plan_name])
	end
	def new
		@user = current_user
		@plan_mode = params["payment_plan"]
		@child_count = params["value"]
		unless @user.children_names.present?
		  params["value"].present? ? params["value"].to_i.times {@user.children_names.build} : @user.children_names.build
	  end
	end

	def create
		@user = current_user
		if @user.plan_name == 'after_school' || @user.plan_name == "before_school_only" || @user.plan_name == "before_school_fater_school" 
			plan_name = User.calculate_plan_name(params["plan_mode"], params["number_of_child"], after_school = @user.plan_name)
			@user.update_attributes(:plan_name => plan_name)
		end
		@user.update_attributes(after_school_params)
		redirect_to payment_path(:plan_name => plan_name)
	end

	def payment
		@user = current_user
		@subscription = Subscription.new
	end

	private
	def after_school_params
		params.require(:user).permit(:first_name,:last_name,:home_address, :home_city,:home_state,:home_zip_code,:plan_mode,:number_of_child,children_names_attributes: [:id, :name, :age,:gender,:grade,:school_name, :_destroy])
	end
end
