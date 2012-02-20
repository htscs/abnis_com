# == Schema Information
# Schema version: 20110605131224
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  password_encrypted :string(255)
#  password_salt      :string(255)
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation

  email_regex = /\A[\w+\d\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  :presence   => true,
                    :length     => {:maximum => 50}
                    
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  
  validates :password,  :presence     => true,
                        :confirmation => true,
                        :length => { :within => 6..40 }
                        
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    self.password_encrypted == encrypt(submitted_password)
  end
  
  def User.authenticate(email, submitted_password)
    #user = User.find_by_email(email) 
    users = User.where(email: email) # il metodo where ritorna un array di oggetti
    user = users[0] # prendo il primo ed unico oggetto user
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def User.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.password_salt == cookie_salt) ? user : nil
  end
  
  private #--------------------
  
  def encrypt_password
    self.password_salt = make_salt if self.new_record?
    self.password_encrypted = encrypt(self.password)
  end
  
  def encrypt(string)
    secure_hash("#{self.password_salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
