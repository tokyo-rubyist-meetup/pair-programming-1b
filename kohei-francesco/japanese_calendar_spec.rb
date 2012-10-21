# coding: utf-8

require 'date'

class Calendar
  @@nengo = [
    { simple: "meiji", name: "明治", start: Date.new(1868, 1, 1) },
    { simple: "taisyo", name: "大正", start: Date.new(1912, 9, 8) },
    { simple: "showa", name: "昭和", start: Date.new(1926, 12, 25) },
    { simple: "heisei", name: "平成", start: Date.new(1989, 1, 8) }
  ]

  END_OF_THE_WORLD = Date.new(2200,1,1)

  def self.calc_range(era, idx)
    last = @@nengo[idx+1]
    last = last.nil? ? END_OF_THE_WORLD : last[:start]
    era[:start]...last
  end

  @@nengo.each_with_index do |era, idx|
    era[:range] = Calendar.calc_range(era, idx)
  end

  NENGO = @@nengo

  def initialize(greg_date)
    @greg_date = Date.parse(greg_date)
  end

  def convert
    nengo = get_nengo @greg_date
    format @greg_date, nengo
  end

  def get_nengo(date)
    nengo = @@nengo.find{ |era| era[:range].include? date }
    year = date.year - nengo[:start].year + 1
    "#{nengo[:name]}#{year}"
  end

  def format(date, nengo)
    "#{nengo}年#{date.month}月#{date.day}日"
  end
end

describe "english to japanese calendar" do
  it "calculates date ranges" do
    Calendar::NENGO.last[:range].should == (Date.new(1989, 1, 8)...Calendar::END_OF_THE_WORLD)
  end

  it "converts date to japanese" do
    date = Calendar.new("2012-10-20").convert
    date.should == "平成24年10月20日"
  end

  it "converts date to japanese" do
    date = Calendar.new("1988-01-01").convert
    date.should == "昭和63年1月1日"
  end
end
