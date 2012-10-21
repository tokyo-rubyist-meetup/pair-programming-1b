# -*- coding: utf-8 -*-

module JapaneseDate

  class Period < Struct.new(:nengo, :start_date)
    def year(gregorian_date)
      gregorian_date.year - start_date.year + 1
    end
  end

  PERIODS = [
    Period.new("平成", Date.parse("1989-1-8")),
    Period.new("昭和", Date.parse("1926-12-25")),
    Period.new("大正", Date.parse("1912-7-30")),
    Period.new("明治", Date.parse("1868-9-8")),
  ]

  def self.lookup_period(date)
    PERIODS.find {|p| p.start_date <= date }
  end

  def self.convert(date)
    d = Date.parse(date)
    period = lookup_period(d)
    d.strftime("#{period.nengo}#{period.year(d)}年%-m月%-d日")
  end
end


require "rspec"

describe JapaneseDate do
  it { JapaneseDate.convert("1912-7-29").should == "明治45年7月29日" } 

  it { JapaneseDate.convert("1912-7-30").should == "大正1年7月30日" } 
  it { JapaneseDate.convert("1926-12-24").should == "大正15年12月24日" } 

  it { JapaneseDate.convert("1926-12-25").should == "昭和1年12月25日" } 
  it { JapaneseDate.convert("1988-1-1").should == "昭和63年1月1日" } 
  it { JapaneseDate.convert("1989-1-7").should == "昭和64年1月7日" } 

  it { JapaneseDate.convert("1989-1-8").should == "平成1年1月8日" } 
  it { JapaneseDate.convert("2012-10-20").should == "平成24年10月20日" } 
end
