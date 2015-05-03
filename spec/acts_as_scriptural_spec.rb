require 'spec_helper'


describe ActsAsScriptural do

  describe "Class Methods" do
    describe "#new" do
      it "should have an abbrev lookup hash for books" do
        foo = ActsAsScriptural.new
        expect(foo.abbreviation_lookup_hash).to be_a Hash
      end
    end
  end

  describe "Instance Methods" do
    describe "parse receives a valid reference" do
      describe "#book_names" do
        it "one book name" do
          result = ActsAsScriptural.new.parse("Gen 1-9")
          expect(result.book_names).to eq ["Genesis"] 
        end
        it "multiple book names" do
          result = ActsAsScriptural.new.parse("Genesis 1-9, Exodus 1-30, 1 John 1-2")
          expect(result.book_names).to match_array  ["Genesis", "Exodus", "1 John"] 
        end
      end
    end
  end
end
=begin
    it "parse_book receives a partial book string returns an integer" do
      bookname = "Ex"

      result = ActsAsScriptural.parse_book(bookname)

      expect(result).to eq 2
    end
    it "parse_book receives a mixed case book string returns an integer" do
      bookname = "exODUS"

      result = ActsAsScriptural.parse_book(bookname)

      expect(result).to eq 2
    end
  end
end
=end
