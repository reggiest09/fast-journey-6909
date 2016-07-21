class AfterSchoolRegistrationsController < ApplicationController
	before_action :authenticate_user!
	def index
	end
	def new
		@user = current_user
		unless @user.children_names.present?
		  params["value"].present? ? params["value"].to_i.times {@user.children_names.build} : @user.children_names.build
	  end
	end

	def create
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
		params.require(:user).permit(:first_name,:last_name,:home_address,:home_city,:home_state,:home_zip_code, children_names_attributes: [:id, :name, :age,:gender,:grade,:school_name, :_destroy])
	end
end
