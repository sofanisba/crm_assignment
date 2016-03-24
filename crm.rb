require_relative 'contacts.rb'

class CRM
  def self.run
      crm = CRM.new
      crm.main_menu
  end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Search by attribute"
    puts "5. Delete a contact"
    puts "6. Exit"
  end #print_main_menu

  def main_menu
    choice = 0
    while true
    print_main_menu
    choice = gets.chomp.to_i
    choose_option(choice)
  end #while
end

  def choose_option(choice)
    case choice
      when 1 then add_contact
      when 2 then modify_contact
      when 3 then display_all
      when 4 then search_contact
      when 5 then delete_contact
      when 6
        puts "Thanks for playing"
        exit
    else
       puts "nope"
    end#case choice
  end#choose_option

#1. Add a contact
  def add_contact
    puts "First Name"
    first_name = gets.chomp.to_s
    puts "Last Name"
    last_name = gets.chomp.to_s
    puts "Email"
    email = gets.chomp.to_s
    puts "Note"
    note = gets.chomp.to_s
    new_contact = Contact.create(first_name, last_name, email: email, note: note)
  end #add_contact

  def modify_contact
    puts "Who do you want to modify (ID number)"
    id_num = gets.chomp.to_i
    contact = Contact.get(id_num)
    puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"

    puts "What do you want to change?"
    puts "1. First Name"
    puts "2. Last Name"
    puts "3. Email Address"
    puts "4. Note"
    puts "5. exit"

    update_options = gets.chomp.to_i
        case update_options
        when 1
          puts "New first name:"
          contact.first_name = gets.chomp.to_s
          puts "New first name = #{contact.first_name.capitalize}"
        when 2
          puts "New last name:"
          contact.last_name = gets.chomp.to_s
          puts "New first name = #{contact.last_name.capitalize}"
        when 3
          puts "New email address:"
          contact.email = gets.chomp.to_s
          puts "New email address = #{contact.email}"
        when 4
          puts "New note:"
          contact.note = gets.chomp.to_s
          puts "Note = #{contact.note}"
        when 5
          exit
        else
          puts "That's not an option, dummy"
        end
    end

#3.  Display all contacts
  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

#4 Search by attribute
  def search_contact
    puts "Whom do you seek?"
    value = gets.chomp.to_s
    Contact.search_by_attribute(value)
  end

#5. Delete contact
  def delete_contact
    puts "Which contact by ID number?"
    user_id = gets.chomp.to_i
    Contact.delete(user_id)
  end



end #CRM class

CRM.run
