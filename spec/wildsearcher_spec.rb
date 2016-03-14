require "spec_helper"

describe Wildsearcher do
  context "version" do
    subject { Wildsearcher::VERSION }
    it { is_expected.to eq "1.0.0" }
  end

=begin
  context "filter_records" do
    let(:car_1) { Car.new(id: 1, year: 2009, make: "VW") }
    let(:car_2) { Car.new(id: 2, year: 2010, make: "Ford") }
    let(:car_3) { Car.new(id: 3, year: 2010, make: "Dodge") }
    let(:car_4) { Car.new(id: 4, year: 2015, make: "Audi") }

    it "should filter appropriately" do
      expect{Car.filter_records(search_fields: [], search_term: "")}.to raise_error NotImplementedError
    end
  end
=end

end
