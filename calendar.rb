#encoding: utf-8
module Calendar
  def self.convert(date)
    return nil unless date
    year, month, day = date.split('-').map(&:to_i)
    if Date.parse(date) >= Date.parse("1989-01-08")
      japanese_year = "平成#{(year - 1989 + 1).to_s.rjust(2, '0')}"
    else
      japanese_year = "昭和#{(year - 1926 + 1).to_s.rjust(2, '0')}"
    end
    "#{japanese_year}年#{month.to_s.rjust(2, '0')}月#{day.to_s.rjust(2, '0')}日"
  end
end