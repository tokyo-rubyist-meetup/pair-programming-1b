# encoding: UTF-8
require 'rspec'
require './program.rb'

describe GregorianToImperial do
  subject { GregorianToImperial.new(date).to_imperial }

  context "input date is 1989-1-8" do
    let(:date) { "1989/01/08" }
    it { should == "平成1年1月8日" }
  end
  
  context "date is 1989-1-7" do
    let(:date) { "1989-1-7" }
    it { should == "昭和64年1月7日"}
  end

  context "date is 1988-1-7" do
    let(:date) { "1988-1-7" }
    it { should == "昭和63年1月7日"}
  end
end
