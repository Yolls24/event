require 'pry'

class User
    @@all_users = []
  
    attr_accessor :email, :age, :city
  
    def initialize(email, age, city)
      @email = email
      @age = age
      @city = city
      @@all_users << self
    end
  
    def self.all
      @@all_users
    end

    def self.find_by_email(email)
        @@all_users.find { |user| user.email == email }
    end
  end
  

