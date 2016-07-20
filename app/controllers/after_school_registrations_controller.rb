class AfterSchoolRegistrationsController < ApplicationController
	def index
	end
	def new
		@user = current_user
		@user.children_names.build
	end

	def create
		binding.pry
		@user = current_user
		@user.update_attributes(after_school_params)
		redirect_to payment_path
	end

	def payment
		@user = current_user
		@subscription = Subscription.new
	end

	private
	def after_school_params
		params.require(:user).permit(:first_name,:last_name,:school_name,:home_address,:home_city,:home_state,:home_zip_code, children_names_attributes: [:id, :name, :age,:gender,:grade,:_destroy])
	end
end
