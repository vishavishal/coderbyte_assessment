require_relative "../params_formatter"

class NormalizeHelper 
  SPLITTER = {
    :dollar_format  =>  '$',
    :percent_format =>  '%',
    :colon_format   =>  ':',
    :hash_format    =>  '#'
  }
  def normalize_params params
    temp_h = {}
    pf_obj = ParamsFormatter.new
    params.each { |param_key, param_value|
      case param_key
      when :dollar_format, :percent_format, :colon_format, :hash_format
        resp = pf_obj.format_file_str param_value, SPLITTER[param_key]
        temp_h.merge!(resp)
      end
    }
    temp_h
  end
end