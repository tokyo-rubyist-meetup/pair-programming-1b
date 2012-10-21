#encoding: utf-8
module Calendar
  def self.convert(date)
    return nil unless date
    year, month, day = date.split('-')
    japanese_year = year.to_i - 1989 + 1
    "平成#{japanese_year}年#{month}月#{day}日"
  end
end