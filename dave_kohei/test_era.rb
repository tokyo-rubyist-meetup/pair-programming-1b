#coding:utf-8

require "minitest/autorun"
require_relative "convert_er"
require 'date'

class TestEra < MiniTest::Unit::TestCase
  def test_gets_era
    #assert_equal "平成元年", EraConverter.era_from_date(Date.new(1989,1,8))
    assert_equal "平成24年", EraConverter.era_from_date(Date.new(2012,1,8))
    assert_equal "昭和54年", EraConverter.era_from_date(Date.new(1979,12,25))
    assert_equal "大正2年", EraConverter.era_from_date(Date.new(1913,7,30))
    assert_equal "明治11年", EraConverter.era_from_date(Date.new(1878,9,7))
  end

  def test_raise_on_unmat
    assert_equal "平成24年10月20日",EraConverter.convert('2012-10-20')
    assert_equal "昭和64年1月7日",EraConverter.convert('1989-1-7')
    assert_equal "平成元年1月8日",EraConverter.convert('1989-1-8')
    #assert_equal "昭和54年12月25日", EraConverter.era_from_date(Date.new(1979,12,25))
    #assert_equal "大正2年", EraConverter.era_from_date(Date.new(1913,7,30))
    #assert_equal "明治11年", EraConverter.era_from_date(Date.new(1878,9,7))
    
  end
end