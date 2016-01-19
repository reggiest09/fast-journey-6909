require 'prawn'
require "prawn/table"
class PdfReports
	def initialize(user)
		@user = user
	end

	def pdf_page_content
		pdf = Prawn::Document.new( :page_layout => :landscape )
		name = @user.email.present? ? @user.email : "N/A"
		logo = "#{Rails.root}/app/assets/images/section-3.jpg"
    pdf.image logo, width: 200, height: 100, position: :left
		pdf.font_size 9
		pdf.text "Generated at: #{@user.created_at.strftime('%H:%M %p %Z on %m/%d/%Y')}", :align => :right
		pdf.text "by: #{name}", :align => :right
		pdf.move_down 20
		pdf.font_size 16
		pdf.font_size 12
		audit_pdf_body(pdf)
  end
  def audit_pdf_body(pdf)
    @data = []
	  sl_no = 1
	  @data << ["Customer ID", "name", "phone", "Amount", "status", "created_at"]
	  if @user.stripe_customers.present?
	  	stripe_customers = @user.stripe_customers.pluck :reference_id
	  	begin
		  	stripe_customers.each do |stripe_customer|
		  		customer = Stripe::Customer.retrieve(stripe_customer)
		  		if customer.charges.present?
		  			customer.charges.data.each do |plan_data|
	            customer_id = stripe_customer
	            amount = (plan_data.amount.to_f) * 0.01
	            status = plan_data.paid
	            name = @user.first_name.present? ? @user.first_name : 'N/A'
	            phone = @user.phone.present? ? @user.phone : 'N/A'
	            created_at = Time.at(plan_data.created).strftime("%m-%d-%Y")
			        @data << [customer_id,name,phone,amount.to_s,status.to_s,created_at]
			        sl_no +=1
			      end
			    end
			  end
			rescue Exception => e
			end
		  pdf_table_data(pdf,@data)
		end
  end
	def pdf_table_data(pdf,stripe_data)
		pdf.move_down 5
		pdf.font_size 9
		pdf.table stripe_data do | t |
			t.header = true
			t.position = :center
			t.column_widths = { 5 => 100 }
			t.column_widths = { 6 => 100 }
			t.cells.padding = 5
			t.cells.borders = []
			t.cells.inline_format = true
			t.row(0).borders = [:bottom]
			t.row(0).border_width = 2
			t.width =700
			t.columns(0..-1).borders = [:right]
			t.columns(5).style(:size => 9, :padding => 2)
			t.row(0).columns(0..8).borders = [:bottom, :right]
			t.row(0).columns(9).borders = [:bottom]
	  end
	  # footer, center aligned
	  pdf.move_down 5
	  pdf.font_size 9
	  #pdf.text "Note: ** means there is no activity data within date range", :align => :left

	  # Adding footer address
	  pdf.font_size 9
	  pdf.text_box "Taps Education And Sports Academy. / USA, United States", { :at => [20,20], :align => :left }
	  pdf.font_size 9
	  pdf.text_box "Phone: (...) ...-.... Fax: (...) ...-....", { :at => [20,20], :align => :right }
	  # add page numbering
	  pdf.number_pages "page <page> of <total>", { :at => [150,0], :align => :right }
	  pdf_data = pdf.render()
		return pdf_data
	end
end
