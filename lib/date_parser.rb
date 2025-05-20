# date_parser.rb
require 'date'

class DateParser
  MONTHS = {
    "janvier" => 1, "février" => 2, "mars" => 3, "avril" => 4,
    "mai" => 5, "juin" => 6, "juillet" => 7, "août" => 8,
    "septembre" => 9, "octobre" => 10, "novembre" => 11, "décembre" => 12
  }

  def self.parse(input)
    match = input.match(/le (\d{1,2}) (\w+) à (\d{1,2}) h(?: (\d{1,2}))?/)
    return nil unless match

    day = match[1].to_i
    month_name = match[2].downcase
    hour = match[3].to_i
    minute = match[4] ? match[4].to_i : 0

    month = MONTHS[month_name]
    return nil unless month

    year = Date.today.year

    date = DateTime.new(year, month, day, hour, minute)
    date < DateTime.now ? date.next_year : date
  rescue
    nil
  end
end

