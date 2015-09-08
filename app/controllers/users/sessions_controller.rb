class Users::SessionsController < Devise::SessionsController
  layout 'user_home_layout'
  def new
    session[:plan_name] = params["plan_name"]
    session[:interval] = params["interval"]
    super
  end
  def create
    case session[:plan_name]
      when "taps"
        session["#{resource_name}_return_to"] = user_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "queen_city"
        session["#{resource_name}_return_to"] = user_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "before_school"
        session["#{resource_name}_return_to"] = user_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "after_school"
        session["#{resource_name}_return_to"] = user_steps_path(plan_name: session[:plan_name],interval: session[:interval])
    end
    super
  end
end
