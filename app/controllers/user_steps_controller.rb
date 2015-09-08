class UserStepsController < ApplicationController
  before_action :authenticate_user!
  include Wicked::Wizard
  steps :new_registration, :student_info, :gardian_details,
        :other_deatils, :redme, :payment

  def show
    @user = current_user
    @subscription = Subscription.new
    render_wizard
  end

  def update
    @user = current_user
    if params[:user][:plan_name].present? && params[:user][:interval].present?
      @user.attributes = person_params.merge(plan: params[:user][:interval], plan_name: params[:user][:plan_name])
    else
      @user.attributes = person_params
    end
    render_wizard @user
  end

private
  def person_params
    params.require(:user).permit(:plan, :plan_name, :first_name, :last_name,
                                 :gender,:age,:school_name,:grade_year,
                                 :home_address,:home_city,:home_state,
                                 :home_zip_code,:ada_accommodation,
                                 :parent_gurdin_email,:mother_name,
                                 :mother_day_number,:mother_cell_num,
                                 :father_name,:father_day_number,
                                 :father_cell_number,:persons_auth,
                                 :other_arrangements,:emergency_contact,
                                 :child_helath_prob,:child_midication,
                                 :child_midication_desc,:snack)
  end

  def stripe_plan_price
    if current_user.plan == "weekly"
      "$50"
    elsif current_user.plan == "monthly"
      "$200"
    end
  end

  def redirect_to_finish_wizard(options = nil)
    redirect_to root_url, notice: "Thank you for signing up."
  end
end
