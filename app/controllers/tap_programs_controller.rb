class TapProgramsController < ApplicationController
	before_action :authenticate_user!, only: [:football_camp, :register_football]
  def index
  end

  def football_camp
  	@user = User.new
  	@user.football_camps.build
  end

  def register_football
  	@user = current_user
    @user.update_attributes(football_params)
    redirect_to root_path
  end

  private
    def football_params
      params.require(:user).permit(football_camps_attributes: [:id, :user_id, :name, :st_adreess,:city,:parent_name, :phone_number, :em_phone_number, :age_and_grade, :email_address,:_destroy,:offensive_position=> [], :defensive_position=> []])
    end
end
