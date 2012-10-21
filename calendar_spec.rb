# encoding: utf-8

require 'rubygems'
require 'rspec'
require "#{File.dirname(__FILE__)}/calendar"

describe Calendar do
  it "should return a blank string for nil input" do
    Calendar.convert(nil).should == nil
  end
end

