# -*- coding: utf-8 -*-
require 'date'

era_dict = {
  "明治" => Time.new(1868,9,8),
  "大正" => Time.new(1912,7,30),
  "昭和" => Time.new(1926,12,25),
  "平成" => Time.new(1989,1,8),
}

era_scheme = [
 Time.new(1868,9,8),
 Time.new(1912,7,30),
 Time.new(1926,12,25),
 Time.new(1989,1,8),
]

input = Time.new(1988,12,24)
era = Time.now

# categorize input into which Japanese year
era_scheme.reverse.each do |value|
  if input >= value
    era = value
    break
  end
end

# adjust the year
if (input.year - era.year + 1) == 1
  year_word = "元"
else 
  year_word = (input.year - era.year + 1).to_s
end

# generate answer
answer = ""
answer << era_dict.invert[era] + year_word + "年" + input.month.to_s + "月" + input.day.to_s + "日"

puts answer

# dictionary for kanji
kanji_dict = {
  "1" => "一",
  "2" => "二",
  "3" => "三",
  "4" => "四",
  "5" => "五",
  "6" => "六",
  "7" => "七",
  "8" => "八",
  "9" => "九",
  "10" => "十",
  "11" => "十一",
  "12" => "十二",
  "13" => "十三",
  "14" => "十四",
  "15" => "十五",
  "16" => "十六",
  "17" => "十七",
  "18" => "十八",
  "19" => "十九",
  "20" => "二十",
  "21" => "二十一",
  "22" => "二十二",
  "23" => "二十三",
  "24" => "二十四",
  "25" => "二十五",
  "26" => "二十六",
  "27" => "二十七",
  "28" => "二十八",
  "29" => "二十九",
  "30" => "三十",
  "31" => "三十一",
  "32" => "三十二",
  "33" => "三十三",
  "34" => "三十四",
  "35" => "三十五",
  "36" => "三十六",
  "37" => "三十七",
  "38" => "三十八",
  "39" => "三十九",
  "40" => "四十",
  "41" => "四十一",
  "42" => "四十二",
  "43" => "四十三",
  "44" => "四十四",
  "45" => "四十五",
  "46" => "四十六",
  "47" => "四十七",
  "48" => "四十八",
  "49" => "四十九",
  "50" => "五十",
  "51" => "五十一",
  "52" => "五十二",
  "53" => "五十三",
  "54" => "五十四",
  "55" => "五十五",
  "56" => "五十六",
  "57" => "五十七",
  "58" => "五十八",
  "59" => "五十九",
  "60" => "六十",
  "61" => "六十一",
  "62" => "六十二",
  "63" => "六十三",
  "64" => "六十四",
  "65" => "六十五",
  "66" => "六十六",
  "67" => "六十七",
  "68" => "六十八",
  "69" => "六十九"
}

answer2 = ""
answer2 << era_dict.invert[era] + kanji_dict[year_word] + "年" + kanji_dict[input.month.to_s] + "月" + kanji_dict[input.day.to_s] + "日"
puts answer2
