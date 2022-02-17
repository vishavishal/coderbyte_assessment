require 'Date'

class ParamsFormatter
  CITY_LIST = {
    :LA => 'Los Angeles',
    :NYC => 'New York City'
  } 

  def format_file_str file_string, split_key
    file_h = {} 
    header = nil

    first_name_index, city_index, birthdate_index = 0, 0, 0
    file_string.each_line do |line|
      unless header
        header = split_line(line, split_key)
        first_name_index  = header.find_index('first_name')
        city_index        = header.find_index('city')
        birthdate_index   = header.find_index('birthdate')
      else
        line_arr = split_line(line, split_key)
        file_h[line_arr[first_name_index]] = {
          :city       => get_city_name(line_arr[city_index]),
          :birth_date => date_converter(line_arr[birthdate_index])
        }
      end
    end
    file_h
  end
  
  def split_line line_str, split_key
    line_str.split(split_key).map(&:strip)
  end

  def date_converter date_str
    begin
      str = Date.parse(date_str).strftime("%-m/%-d/%Y")
    rescue 
      return date_str
    end
    return str
  end

  def get_city_name city
    return CITY_LIST[city.to_sym] ? CITY_LIST[city.to_sym] : city 
  end
end