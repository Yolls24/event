require 'time'


class WorkEvent < Event
    attr_accessor :location
  
    def initialize(start_date, duration, title, attendees, location)
        @location = location # j'ai rajouté cette ligne
    
        super(start_date, duration, title, attendees) #fait appel au initialize de la classe Event
      end 
  
    def is_past?
      @start_time + (@duration * 60) < Time.now
    end
  end
  