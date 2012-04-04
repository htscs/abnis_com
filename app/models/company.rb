class Company < ActiveRecord::Base
  
  has_many :company_person_employments
  has_many :people, :through => :company_person_employments

  #attr_accessor   :password
  attr_accessible :name, :image, :sector, :status, :memo
  mount_uploader :image, ImageUploader

  validates :name,     		:presence   => true,
                            :length     => {:maximum => 255}

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
