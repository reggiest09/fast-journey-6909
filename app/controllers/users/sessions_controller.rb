class Users::SessionsController < Devise::SessionsController
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
      when "school_closing"
        session["#{resource_name}_return_to"] = school_closing_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "football"
        session["#{resource_name}_return_to"] = football_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "basketball"
        session["#{resource_name}_return_to"] = football_steps_path(plan_name: session[:plan_name],interval: session[:interval])
      when "summer_wk" || "summer_wk1"
        session["#{resource_name}_return_to"] = football_steps_path(plan_name: session[:plan_name],interval: session[:interval])
    end
    super
  end
end
