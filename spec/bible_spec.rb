require 'spec_helper'


describe Bible do
  describe "#book_from_index" do
    it "returns a book object from a valid index value (1-66)" do
      b = Bible.new.book_from_index(40)
      expect(b.name).to eq "Matthew"
    end
  end
end
