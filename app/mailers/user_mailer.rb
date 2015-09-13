class UserMailer < ApplicationMailer
  # default from: 'support@taps.com'
  def send_email_to_admin
    mail(:from => "support@taps.com", :to => ENV["ADMIN_EMAIL"], :subject => "New Registraion", :body => "There is a new registration on taps please have a look at admin section for details")
  end
end
