require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_people
  end
end

def make_users
  admin = User.create!( :name => "Example User",
                        :email => "example@railstutorial.org",
                        :password => "foobar",
                        :password_confirmation => "foobar")
  #admin.toggle! :admin
  99.times do |n|
    name = Faker::Name.name
    email = "exampe-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end  
end

def make_people
  Person.create!( :title => "Mr.",
                  :first_name => "Flavio",
                  :last_name => "Bordoni",
                  :homonymy => "quello con un occhio solo",
                  :tax_code => "BRDFLV75M17H432Y",
                  :male => true,
                  :memo => "Mi ricordo quando ero bambino c'era un uomo piu' grande di me ...")
                          
  99.times do |n|
    title = "Mr."
    first_name = Faker::Name.name
    last_name = Faker::Name.name
    homonymy = Faker::Lorem.sentence(1)
    tax_code = "BLABLA01G12HJ64W"
    male = true
    memo = Faker::Lorem.sentence(5)
    Person.create!(:title => title,
                   :first_name => first_name,
                   :last_name => last_name,
                   :homonymy => homonymy,
                   :tax_code => tax_code,
                   :male => male,
                   :memo => memo)
  end  
end