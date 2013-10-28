class Contact

attr_accessor :fname, :lname, :email, :note, :id, :rolodex_contact

  def initialize(fname, lname, email, note)
    @fname = fname
    @lname = lname
    @email = email
    @note = note
  end

 

end