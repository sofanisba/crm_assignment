class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 1

  def initialize(id, first_name, last_name, options ={})
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]
  end #initialize

  def self.create(first_name, last_name, options ={})
    # 1. create new contact
    # 2. assign new contact a unique ID
      new_contact = new(@@id, first_name,last_name, options) #==Contact.new
    # 3. add new contact to the list
      @@contacts << new_contact
    # 4. Increment the global ID
      @@id += 1
    #5. return the newly created contact
      new_contact
    end #self.create


  def self.all
    return @@contacts
  end

  def self.get(id_num)
    @@contacts.find { |contact| contact.id == id_num}
  end


  def self.search_by_attribute(value)
    @@contacts.each do |contact|
      if contact.first_name == value || contact.last_name == value || contact.id == value ||contact.email == value ||contact.note == value
        puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
      end#if
    end#do
  end #self.search_by_attribute

  def self.delete(user_id)
    @@contacts.delete_if { |contact| contact.id == user_id}
  end


  def full_name
    "#{first_name} #{last_name}"
  end



end #class Contact
