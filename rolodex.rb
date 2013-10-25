class Rolodex


@rolodex_contact = []
@id = 1000

	def self.rolodex_contact
		@rolodex_contact
	end

	def self.get_current_id
		@id
	end

	def self.add_contact(contact)
		contact.id = @id
		@rolodex_contact << contact
		
		@id += 1

	end
	

end


