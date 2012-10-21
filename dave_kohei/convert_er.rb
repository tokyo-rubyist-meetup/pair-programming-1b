#coding:utf-8
require 'date'

class EraConverter
  def self.convert(source_date)
    parsed_date = DateTime.parse(source_date)
    "#{self.era_from_date(parsed_date)}#{parsed_date.mon}月#{parsed_date.mday}日"
  end

  def self.era_from_date(source_date)
    eras = [{ :start => Date.new(1989,1,8), :string => "平成" },
            { :start => Date.new(1926,12,25), :string => "昭和" },
            { :start => Date.new(1912,7,30), :string => "大正" },
            { :start => Date.new(1868,9,8), :string => "明治" } ]

    eras.each do |e|
      if source_date >= e[:start]
        return "#{e[:string]}#{source_date.year - (e[:start].year - 1)}年"
      end
    end
  end
end