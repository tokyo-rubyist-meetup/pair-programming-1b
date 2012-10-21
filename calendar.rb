#encoding: utf-8
module Calendar
  def self.convert(date)
    return nil unless date
    year, month, day = date.split('-').map(&:to_i)
    if Date.parse(date) >= Date.parse("1989-01-08")
      japanese_year = "平成#{(year - 1989 + 1).to_s.rjust(2, '0')}"
    elsif Date.parse(date) >= Date.parse("1926-12-25")
      japanese_year = "昭和#{(year - 1926 + 1).to_s.rjust(2, '0')}"
    elsif Date.parse(date) >= Date.parse("1912-07-30")
      japanese_year = "大正#{(year - 1912 + 1).to_s.rjust(2, '0')}"
    elsif Date.parse(date) >= Date.parse("1868-09-08")
      japanese_year = "明治#{(year - 1868 + 1).to_s.rjust(2, '0')}"
    else
      raise ArgumentError, "Dates earlier than the Meiji era are unsupported"
    end
    "#{japanese_year}年#{month.to_s.rjust(2, '0')}月#{day.to_s.rjust(2, '0')}日"
  end
end