require 'spec_helper'

describe ActsAsScriptural do

  describe "Class Methods" do
    it "parse_book receives a valid book string returns an integer" do
      bookname = "Genesis"

      result = ActsAsScriptural.parse_book(bookname)

      expect(result).to eq 1
    end
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
