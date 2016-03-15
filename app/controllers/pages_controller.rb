class PagesController < ApplicationController
  layout 'user_home_layout', only: :index
  def qc_before_after_school
  end

  def qc_after_school
  end
  
  def qc_befor_school
  end

  def taps_after_school
  end

  def taps_gallery
  end

  def index
  end

  def afterschool
  end

  def about
  end

  def contact
  end

  def program
  end

  def gallery
  end

  def taps
  end

  def st_payment
  end

  def show
    @user = current_user
  end

  def create
  end

  def school_registration
    @user = User.find(params[:id])
    @user.update_attributes(person_params)
  end


  private
    def person_params
      params.require(:user).permit(:first_name, :last_name,:gender,:age,:school_name,:grade_year,:address,:city,:state,:zip_code)
    end
end
