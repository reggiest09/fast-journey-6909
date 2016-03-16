class ProfilesController < ApplicationController
	#layout 'user_home_layout'
	require 'prawn'
	def index
		
	end

	def download_pdf
		report_data = PdfReports.new(current_user).pdf_page_content
		file_name = "#{current_user.created_at.strftime('%m/%d/%Y')}.pdf"
		send_data( report_data, :type => "application/pdf", :style => 'inline', :filename => file_name) 
	end
end