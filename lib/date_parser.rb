require 'time'
require 'date'

class DateParser
  MONTHS = {
    "janvier" => 1, "février" => 2, "mars" => 3, "avril" => 4,
    "mai" => 5, "juin" => 6, "juillet" => 7, "août" => 8,
    "septembre" => 9, "octobre" => 10, "novembre" => 11, "décembre" => 12
  }

  def self.parse(date_str)
    # Ex : "le 14 octobre à 15 h 30" ou "le 14 octobre à 15 h"
    match = date_str.match(/le (\d{1,2}) (\w+) à (\d{1,2}) h(?: (\d{1,2}))?/)

    unless match
      puts "Format invalide. Essayez : le 14 octobre à 15 h 30"
      return nil
    end

    day = match[1].to_i
    month = MONTHS[match[2].downcase]
    hour = match[3].to_i
    minute = match[4] ? match[4].to_i : 0
    year = Date.today.year

    # Si la date est passée, on suppose l’année prochaine
    begin
      parsed_time = Time.new(year, month, day, hour, minute)
      parsed_time < Time.now ? Time.new(year + 1, month, day, hour, minute) : parsed_time
    rescue ArgumentError
      puts "Date invalide"
      nil
    end
  end
end

