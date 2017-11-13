require_relative 'contact'
require 'pry'
class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true 
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit_program
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Which contact would you like to edit?  Enter ID"
    id = gets.chomp.to_i
    puts "What attribute would you like to edit?"
    puts "first_name \n last_name \n email \n note"
    attrb = gets.chomp
    puts "whats the new value."
    value = gets.chomp
    Contact.update(id,attrb,value)
  end

  def delete_contact
    puts "Which contact would you like to delete?  Enter ID"
    id = gets.chomp.to_i
    Contact.delete(id)
  end

  def display_all_contacts
    puts "#{Contact.all}"
  end

  def search_by_attribute
    puts "Which attribute would you like to search by?"
    puts "first_name \n last_name \n email"
    attrb = gets.chomp
    puts "Whats the value you want to search by?"
    value = gets.chomp
    puts "#{Contact.find_by(attrb, value)}"
  end

  def exit_program
    abort("you have exited.")
  end

end

contacts = CRM.new("William")
contacts.main_menu
