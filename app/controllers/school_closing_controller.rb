class SchoolClosingController < ApplicationController

  def show
    @user = current_user
    @subscription = Subscription.new
  end

  def update
    @user = current_user
    if params[:user][:plan_name].present? && params[:user][:interval].present?
      @user.attributes = person_params.merge(plan: params[:user][:interval], plan_name: params[:user][:plan_name])
    else
      @user.attributes = person_params
    end
    if @user.save
      redirect_to payment_path
    else
      render 'show'
    end
    @subscription = Subscription.new
  end

  def payment
    @subscription = Subscription.new
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
                                 :child_midication_desc,:snack, :holiday)
  end
end
