#coding:utf-8
require 'date'

#平成 => { :start_year => 1989, :end_year => DateTime.now.year }

class EraConverter
  def self.convert(source_date)
    #year = source_date.split("-")[0]
    #month = source_date.split("-")[1]
    parsed_date = DateTime.parse(source_date)
    "#{self.era_from_date(parsed_date)}#{parsed_date.mon}月#{parsed_date.mday}日"
    #Date.new(source_date.split("-")
  end

  def self.era_from_date(source_date)
    heisei_start = Date.new(1989,1,8)
    showa_start = Date.new(1926,12,25)
    taisho_start = Date.new(1912,7,30)
    meiji_start = Date.new(1868,9,8)
    if source_date >= heisei_start
      "平成#{source_date.year - (heisei_start.year - 1)}年"
    elsif source_date >= showa_start
      "昭和#{source_date.year - (showa_start.year - 1)}年"
    elsif source_date >= taisho_start
      "大正#{source_date.year - (taisho_start.year - 1)}年"
    elsif source_date >= meiji_start
      "明治#{source_date.year - (meiji_start.year - 1)}年"
    end
  end
end