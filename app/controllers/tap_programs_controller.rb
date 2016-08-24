class TapProgramsController < ApplicationController
  layout 'application'
	before_action :authenticate_user!, only: [:football_camp, :register_football]
  def index
  end

  def football_camp
  	@user = current_user.football_camps.new
  end

  def register_football
    @football = current_user.football_camps.new(football_params)
    @football.save
    redirect_to root_path
  end

  private
    def football_params
      params.require(:football_camp).permit(:st_adreess,:city,:parent_name, :phone_number, :em_phone_number, :age_and_grade, :email_address,:_destroy,:offensive_position=> [], :defensive_position=> [],:name => [])
    end
end
