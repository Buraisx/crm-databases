class Contact
  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @first_name = first_name 
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end
  # READERS
  def email
    @email
  end
  def email=(email)
    @email = email
  end
  def id
    @id
  end
  def first_name
    @first_name
  end
  def last_name
    @last_name
  end
  def first_name=(first_name)
    @first_name = first_name
  end
  def last_name=(last_name)
    @last_name = last_name
  end
  def note=(note)
    @note = note
  end
  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update(id, attributes,value)
    edit_contact = Contact.find(id)
    if attributes == "first_name"
      edit_contact.first_name= value
    elsif attributes == "last_name"
      edit_contact.last_name= value
    elsif attributes == "email"
      edit_contact.email= value
    elsif attributes == "note"
      edit_contact.note= value
    else
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
    @@contacts.each do |contact|
      case attribute
      when "first_name" then
        if contact.first_name == value
            return contact.full_name
        end
      when "last_name" then
        if contact.last_name == value
          return contact.full_name
        end
      when "email" then 
        if contact.email == value
          return contact.full_name
        end
      end
    end
    return "not found."
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(id)
    deleted = Contact.find(id)
    @@contacts.delete(deleted)
  end

  # Feel free to add other methods here, if you need them.
  
end
