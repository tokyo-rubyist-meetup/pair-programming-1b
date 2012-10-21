# encoding: UTF-8
require 'date'

class GregorianToImperial
  HEISEI = Date.parse("1989-1-8")

  def initialize(date)
    @date = Date.parse(date)
  end
  
  def to_imperial
    if @date < HEISEI # Showa
      output = "昭和"
      era_year = 777 #now we need to know the previous era here
    else # Heisei
      output = "平成"
      era_year = @date.year - (HEISEI.year - 1)
    end
    output = output + "#{ era_year }年#{ @date.month }月#{ @date.day }日"
  end
end