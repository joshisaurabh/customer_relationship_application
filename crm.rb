require_relative "rolodex"
require_relative "contact"

class CRM
	def run_crm
		print_main_menu
		user_selection_number = gets.chomp.to_i
		get_user_input(user_selection_number)
	end

	def print_main_menu
	  system("clear")
	  puts "Welcome to Customer Relationship Application"
	  puts "============================================"
	  puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display a contact"
	  puts "[6] Display an attribute" 
	  puts "[7] Exit"
	  puts "Enter a number: "
	end

	def get_user_input(number)
		
	  	if number == 1
	  		add_new_contact
	  	elsif number == 2
	  		modify_contact
	  	elsif number == 3
	  		delete_contact
	  	elsif number == 4
	  		display_all_contact
	  	elsif number == 5
	  		display_contact(0)
	  	elsif number == 6		
	  		display_an_attribute
	  	elsif number == 7
	  		exit_crm
	  	else
			input_validator
	  		sleep 1
	  		run_crm		
	  	end
	  end

	def  add_new_contact
		
		puts "Please enter first name"
		fname = gets.chomp
		
		puts "Please enter last name"
		lname = gets.chomp

		puts "Please enter your email"
		email = gets.chomp
		
		puts "Please enter a note"
		note = gets.chomp	

		contact = Contact.new(fname,lname,email,note)
		Rolodex.add_contact(contact)

		run_crm


	end

	def modify_contact
		# display_contact
			contact = Rolodex.rolodex_contact # this makes an array instance of the contact class array
		 	puts "Please enter Customer number"
		 	cust_num = gets.chomp.to_i
		 	sleep 1
		 	#puts contact.id
		 	number_mod = 0
		 	namef_mod = ""
		 	namel_mod = ""
		 	email_mod =""
		 	note_mod =""

		 	contact.each do |x| 
		 		if x.id == cust_num
		 		puts "Customer found"
		 		number_mod=x.id
		 		puts number_mod
		 		namef_mod =x.fname
		 		namel_mod = x.fname
		 		email_mod = x.email
		 		note_mod = x.note
		 		end		 		
		 	end
		 		puts "Customer Number : #{number_mod}"
		 		puts "First Name      : #{namef_mod}"
		 		puts "Last Name       : #{namef_mod}"
		 		puts "Email           : #{email_mod}"
		 		puts "Note            : #{note_mod}"
		 		sleep 1

		puts "What do you want to change in the contact?"
		puts "Enter 1 for First Name"
		puts "Enter 2 for Last Name"
		puts "Enter 3 for Email"
		puts "Enter 4 for Note"
		# modify_user_input

		number = gets.chomp.to_i # remove this if activating modify_user_input method
		if number == 1
			puts "Please enter new first name"
	  		fname = gets.chomp
	  		confirm_modify
	  		namef_mod = fname

	  	elsif number == 2
	  		puts "Please enter new last name"
	  		lname = gets.chomp
	  		confirm_modify
	  		namel_mod=lname
	  	elsif number == 3
	  		puts "Please enter new email"
	  		email = gets.chomp
	  		confirm_modify
	  		email_mod=email
	  	elsif number == 4
	  		puts "Please enter new note"
	  		note = gets.chomp
	  		confirm_modify
	  		note_mod=note
	  	else
	  		input_validator
	  		modify_contact
	  	end
	  	contact = Contact.new(namef_mod,namel_mod,email_mod,note_mod)
	  	puts "Update done"
	  	sleep 1
	  	Rolodex.add_contact(contact)
	  	run_crm

	end


	# def modify_user_input
	# 	 user_selection_number = gets.chomp.to_i
	# 	 unless user_selection_number != (1..4)
	# 	 	input_validator
	# 	 	modify_user_input
	# 	 end

	# 	 modify_option(user_selection_number)
	# end


	def modify_option(number)
		# if number == 1
		# 	puts "Please enter new first name"
	 #  		fname = gets.chomp
	 #  		puts @fname
	 #  		confirm_modify

	 #  		@fname=fname

	 #  	elsif number == 2
	 #  		puts "Please enter new last name"
	 #  		lname = gets.chomp
	 #  		confirm_modify
	 #  	elsif number == 3
	 #  		puts "Please enter new email"
	 #  		email = gets.chomp
	 #  		confirm_modify
	 #  	elsif number == 4
	 #  		puts "Please enter new note"
	 #  		note = gets.chomp
	 #  		confirm_modify
	 #  	else
	 #  		input_validator
	 #  		modify_contact
	 #  	end
	end

	def input_validator
		puts "Incorrect input! Please try again"
	  	sleep 1
		
	end

	def confirm_modify
		puts "Enter 'yes' to confirm 'no' to cancel"
		#contact = Rolodex.rolodex_contact
		confirm = gets.chomp
		if confirm.downcase == "yes"
			return
		elsif confirm.downcase == "no"
			put "No worries - No change done"
			sleep 1
			print_main_menu

		else
			input_validator
			sleep 1
			confirm_modify	
		end	
		
	end

	def delete_contact
		checksum=1
		display_contact(checksum)
	end


	def display_all_contact
		#puts Rolodex.rolodex_contact.inspect
		contact = Rolodex.rolodex_contact		
		print  "| Customer Number |"
			print "  Last Name  |" 
			print " First Name |"
			print " Email      |"
			puts "  Note      |"
		contact.each do |x|
			puts "#{x.id}	#{x.lname}	#{x.fname}	#{x.email}	#{x.note}"
		end
		sleep 5
		run_crm

	end

	def display_contact(checksum) # this display the customer selected by customer number
		 	#puts Rolodex.rolodex_contact.inspect # .inspect helps to show the value in the contact instance of the 
		 	contact = Rolodex.rolodex_contact # this makes an array instance of the contact class array
		 	puts "Please enter Customer number"
		 	cust_num = gets.chomp.to_i
		 
		 	sleep 1
		 	#puts contact.id
		 	
		 	number_mod = 0
		 	namef_mod = ""
		 	namel_mod = ""
		 	email_mod =""
		 	note_mod =""

		 	contact.each do |x| 
		 		if x.id == cust_num
		 		puts "Customer found"
		 		number_mod=x.id
		 		puts number_mod
		 		namef_mod =x.fname
		 		namel_mod = x.fname
		 		email_mod = x.email
		 		note_mod = x.note
		 		end		 		
		 	end
		 		puts "Customer Number : #{number_mod}"
		 		puts "First Name      : #{namef_mod}"
		 		puts "Last Name       : #{namef_mod}"
		 		puts "Email           : #{email_mod}"
		 		puts "Note            : #{note_mod}"

		 		if checksum ==1
		 			contact.delete_if {|x| x.id == cust_num}
		 			puts "Record deleted"		 				
		 		end
		 			sleep 1
		 			run_crm
	end

	def display_an_attribute
		contact = Rolodex.rolodex_contact		
		print  "| Customer Number |"
			print "  Last Name  |" 
			print " First Name |"
			print " Email      |"
			puts "  Note      |"
		contact.each do |x|
			puts "#{x.id}	#{x.lname}	#{x.fname}	#{x.email}	#{x.note}"
		end
		sleep 5
		run_crm
	end

	def exit_crm
		exit
	end
end
my_crm = CRM.new
my_crm.run_crm