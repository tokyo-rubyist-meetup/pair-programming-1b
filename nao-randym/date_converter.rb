# encoding: UTF-8
require 'date'
a = %w[18680908 19120730 19261225 19890108 20300101]
$eras = %w[明治 大正 昭和 平成]
$date_ranges= {}
(a.size-1).times do |i|
  $date_ranges[(Date.parse(a[i])...Date.parse(a[i+1]))] = $eras[i]
end

def convert(input_date)
  output = 'WTF'
  date = Date.parse(input_date.gsub!('-', ''))
  $date_ranges.each do |range, era|
    if range.include? date
      nengo = era
      nengo_year = date.year - range.first.year + 1
      output = date.strftime("#{nengo}#{nengo_year}年%m月%d日")
    end
  end
  output
end

require 'test/unit'

class TestFoo < Test::Unit::TestCase

  def test_simple_one
    ret = convert('2012-10-20')
    assert_equal('平成24年10月20日', ret)
  end


end
