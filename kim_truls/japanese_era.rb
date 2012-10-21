# encoding: utf-8
require 'rspec'
require 'date'

module JapaneseEra
    Eras = {"平成" => Date.new(1989, 1, 8),
        "昭和" => Date.new(1926, 12, 25),
        "大正" => Date.new(1912, 07, 30),
        "明治" => Date.new(1868, 9, 8),
    }

    def self.convert date_str
        date = Date.parse(date_str)
        date_str_jp = ""
        Eras.each do |era, start|
            return "#{era}#{date.year - start.year + 1}年#{date.month}月#{date.day}日" if date >= start
        end
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
