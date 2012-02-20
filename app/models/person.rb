class Person < ActiveRecord::Base

  #attr_accessor   :password
  attr_accessible :title, :first_name, :last_name, :homonymy, :image, :tax_code, :male, :memo, :born_date
  
  validates :title,         :presence   => true,
                            :length     => {:maximum => 15}

  validates :first_name,    :presence   => true,
                            :length     => {:maximum => 50}

  validates :last_name,     :presence   => true,
                            :length     => {:maximum => 50}

  validates :homonymy,      :length     => {:maximum => 255}

  scope :search, lambda {|query| where(["first_name LIKE ? OR last_name LIKE ?", "%#{query}%","%#{query}%"])}

end
