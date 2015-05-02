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
    describe "#parse_chapters receives a valid reference" do
      it "should store one book name in #book_names" do
        result = ActsAsScriptural.new.parse("Gen 1-9")
        expect(result.book_names).to eq ["Genesis"] 
      end
      it "should store multiple book names in #book_names" do
        result = ActsAsScriptural.new.parse("Genesis 1, Exodus 1")
        expect(result.book_names).to match_array  ["Genesis", "Exodus"] 
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
