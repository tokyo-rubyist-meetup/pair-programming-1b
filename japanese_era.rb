# encoding: utf-8

class JapaneseDateConverer
  @eras = [
           [ (Time.mktime(1868, 1, 1)..Time.mktime(1912, 7, 29, 23, 59, 59)), '明治'],
           [ (Time.mktime(1912, 7, 30)..Time.mktime(1926, 12, 24, 23, 59, 59)), '大正'],
           [ (Time.mktime(1926, 12, 25)..Time.mktime(1989, 1, 7, 23, 59, 59)), '昭和'],
           [ (Time.mktime(1989, 1, 8)..Time.mktime(2030,1,1)), '平成']
          ]

  def self.japanese_date(time)
    range, emp = @eras.find { |tr, emp| tr.cover?(time) }
    raise "Unknown Japanese era for time #{time}" if range.nil?
    eyear = (time.year - range.first.year) + 1
    "#{emp}#{eyear}年#{time.month}月#{time.day}日"
  end

end

require 'minitest/autorun'
class TestJapaneseDateConverter < MiniTest::Unit::TestCase

  def test_dates
    assert_equal '平成24年10月20日', JapaneseDateConverer.japanese_date(Time.mktime(2012,10,20))
    assert_equal '昭和64年1月7日', JapaneseDateConverer.japanese_date(Time.mktime(1989, 1, 7))
    assert_equal '平成1年1月8日', JapaneseDateConverer.japanese_date(Time.mktime(1989, 1, 8))
    assert_equal '昭和52年7月7日', JapaneseDateConverer.japanese_date(Time.mktime(1977, 7, 7))
    assert_equal '大正15年12月24日', JapaneseDateConverer.japanese_date(Time.mktime(1926, 12, 24))
    assert_equal '昭和1年12月25日', JapaneseDateConverer.japanese_date(Time.mktime(1926, 12, 25))
    assert_equal '明治1年1月1日', JapaneseDateConverer.japanese_date(Time.mktime(1868, 1, 1))
  end

  def test_unknown_date
    assert_raises(RuntimeError) do
      JapaneseDateConverer.japanese_date(Time.mktime(2900, 2,3))
    end
  end
end
