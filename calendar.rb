#encoding: utf-8
module Calendar
  def self.convert(date)
    return nil unless date
    year, month, day = date.split('-')
    if year.to_i >= 1989
      japanese_year = "平成#{year.to_i - 1989 + 1}"
    else
      japanese_year = "昭和#{year.to_i - 1926 + 1}"
    end
    "#{japanese_year}年#{month}月#{day}日"
  end
end