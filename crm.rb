require_relative "rolodex"
require_relative "contact"


	

def main_menu

  puts "[1] Add a new contact"
  puts "[2] Modify an existing contact"
  puts "[3] Delete a contact"
  puts "[4] Display all the contacts"
  puts "[5] Display an attribute" 
  puts "[6] Exit"
  puts "Enter a number: "
  number = gets.chomp.to_i
  if number ==1
  	user_input
  end

	
end

def user_input
	
	puts "Please enter first name"
	fname = gets.chomp
	
	# if fname = Integer
	# 	puts "error"
	# end

	puts "Please enter last name"
	lname = gets.chomp

	puts "Please enter your email"
	email = gets.chomp
	
	puts "Please enter a note"
	note = gets.chomp	

contact = Contact.new(fname,lname,email,note)
# puts contact.fname

puts Rolodex.add_contact(contact)
# puts Rolodex.rolodex_contact
puts contact.email
puts Rolodex.add_contact(contact)


end

	



	


main_menu
# contact1 = AddContact.new
# puts contact1

