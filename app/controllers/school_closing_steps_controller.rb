class SchoolClosingStepsController < ApplicationController
   layout 'application'
  before_action :authenticate_user!
  def index
    @user = current_user
    @user.update_attributes(:plan_name => params[:plan_name], :plan => params[:payment_plan])
    @subscription = Subscription.new
  end

   def update
    @user = current_user
    if params[:user][:plan_name].present? && params[:user][:payment_plan].present?
      @user.attributes = person_params.merge(plan: params[:user][:payment_plan], plan_name: params[:user][:plan_name])
    else
      @user.attributes = person_params
    end
    @user.attributes = person_params.merge(child_name: params[:user][:child_name].present? ? params[:user][:child_name] : nil)
    if @user.save
      redirect_to payment_path
    else
      render 'index'
    end
    @subscription = Subscription.new
  end

  def payment
    @subscription = Subscription.new
  end
  private
  def person_params
    params.require(:user).permit(:plan, :plan_name,:first_name, :last_name,
                                 :gender,:age,:school_name,:grade_year,
                                 :home_address,:home_city,:home_state,
                                 :home_zip_code,:ada_accommodation,
                                 :parent_gurdin_email,:mother_name,
                                 :mother_day_number,:mother_cell_num,
                                 :father_name,:father_day_number,
                                 :father_cell_number,:persons_auth,
                                 :other_arrangements,:emergency_contact,
                                 :child_helath_prob,:child_midication,
                                 :child_midication_desc,:snack,:holiday => [])
  end
end
