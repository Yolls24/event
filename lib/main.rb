require_relative 'user'
require_relative 'work_event'
require 'pry'

julie = User.new("julie@email.com", 35, "Paris")
jean = User.new("jean@email.com", 42, "Lyon")

binding.pry
