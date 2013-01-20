# encoding: UTF-8
require 'date'

class GregorianToImperial
  HEISEI = Date.parse("1989-1-8")
  SHOWA = Date.parse("1926-12-25")

  def initialize(date)
    @date = Date.parse(date)
  end
  
  def to_imperial
    if @date < HEISEI # Showa
      output = "昭和"
      era_year = @date.year - (SHOWA.year - 1)
    else # Heisei
      output = "平成"
      era_year = @date.year - (HEISEI.year - 1)
    end
    output = output + "#{ era_year }年#{ @date.month }月#{ @date.day }日"
  end
end