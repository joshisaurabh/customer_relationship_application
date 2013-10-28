require_relative "contact"

class Rolodex


	@rolodex_contact = Array.new
	@id = 1000
	
	     


	def self.add_contact(contact)
		contact.id = @id	
		#puts "Ihv run rolodex add contact method"
		@rolodex_contact << contact
		@id += 1
		puts Rolodex.rolodex_contact.inspect

	end
	
	def self.rolodex_contact
		@rolodex_contact
	end 

end

