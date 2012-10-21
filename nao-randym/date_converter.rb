# encoding: UTF-8
require 'date'
a = %w[18730101 19120730 19261225 19890108]
a << (Time.now+(60*60*24)).strftime('%Y%m%d')
eras = %w[明治 大正 昭和 平成]
$date_ranges= {}
(a.size-1).times do |i|
  $date_ranges[(Date.parse(a[i])...Date.parse(a[i+1]))] = eras[i]
end

def convert(input_date)

  output = 'Your date sucks.'
  date = Date.parse(input_date.gsub!('-', ''))
  $date_ranges.each do |range, era|
    if range.include? date
      nengo = era
      nengo_year = date.year - range.first.year + 1
      nengo_year += 5 if era == '明治'
      output = date.strftime("#{nengo}#{nengo_year}年%-m月%-d日")
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

  def test_showa_end
    ret = convert('1989-01-07')
    assert_equal('昭和64年1月7日', ret)
  end

  def test_heisei_start
    ret = convert('1989-01-08')
    assert_equal('平成1年1月8日', ret)
  end

  def test_out_of_bounds_max
    ret = convert((Time.now+(60*60*24)).strftime('%Y-%m-%d'))
    assert_equal('Your date sucks.', ret)
  end

  def test_just_in_bounds_max
    ret = convert(Time.now.strftime('%Y-%m-%d'))
    assert_not_equal('Your date sucks.', ret)
  end

  def test_out_of_bounds_min
    ret = convert('1872-12-31')
    assert_equal('Your date sucks.', ret)
  end

  def test_just_in_bounds_min
    ret = convert('1873-01-01')
    assert_equal('明治6年1月1日', ret)
  end

  def test_out_of_bounds_max
    ret = convert('2030-01-01')
    assert_equal('Your date sucks.', ret)
  end
end
