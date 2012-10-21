# encoding: utf-8
require 'rspec'
require 'date'

module JapaneseEra
    def self.convert date_str
        date = Date.parse(date_str)
        date_str_jp = ""
        if date >= Date.new(1989,1,8)
            date_str_jp = "平成#{date.year - 1988}年#{date.month}月#{date.day}日"
        elsif date >= Date.new(1926, 12, 25)
            date_str_jp = "昭和#{date.year - 1925}年#{date.month}月#{date.day}日"
        elsif date >= Date.new(1912, 07, 30)
            date_str_jp = "大正#{date.year - 1911}年#{date.month}月#{date.day}日"
        else 
            date_str_jp = "明治#{date.year - 1867}年#{date.month}月#{date.day}日"
        end
         return date_str_jp
    end
end

describe JapaneseEra do
    describe "#convert" do
        it "can convert year to 平成" do
            JapaneseEra.convert("1989-01-08").should eq "平成1年1月8日"
        end
        it "can convert year to 昭和" do
            JapaneseEra.convert("1989-01-07").should eq "昭和64年1月7日"
            JapaneseEra.convert("1926-12-25").should eq "昭和1年12月25日"
        end
        it "can convert year to 大正" do
            JapaneseEra.convert("1912-07-30").should eq "大正1年7月30日"
            JapaneseEra.convert("1926-12-24").should eq "大正15年12月24日"
        end
        it "can convert year to 明治" do
            JapaneseEra.convert("1912-07-29").should eq "明治45年7月29日"
        end
    end
end
