# encoding: utf-8

require 'rubygems'
require 'rspec'
require "#{File.dirname(__FILE__)}/calendar"

describe Calendar do
  it "should return a blank string for nil input" do
    Calendar.convert(nil).should == nil
  end
  
  it "should work for today" do
    Calendar.convert("2012-10-20").should == "平成24年10月20日"
  end

  it "should work for border of era" do
    Calendar.convert("1989-01-07").should == "昭和64年01月07日"
    Calendar.convert("1989-01-08").should == "平成01年01月08日"
    Calendar.convert("1989-01-09").should == "平成01年01月09日"
  end

  it "should work for Showa dates (natsukashii)" do
    Calendar.convert("1979-08-08").should == "昭和54年08月08日"
  end

it "should work for Taisho dates (furui)" do
  Calendar.convert("1912-07-30").should == "大正01年07月30日"
end
end

