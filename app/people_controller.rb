require_relative 'helper/normalize_helper'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    norm_object = NormalizeHelper.new
    arr = []

    temp_h = norm_object.normalize_params(params)
    temp_h.sort.collect{|k,v| "#{k}, #{v[:city]}, #{v[:birth_date]}"}
  end

  private

  attr_reader :params
end
