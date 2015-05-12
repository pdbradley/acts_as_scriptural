require 'spec_helper'


describe ActsAsScriptural do

  describe "#parse valid references" do
    it "parses a single book abbreviation and chapter" do
      result = ActsAsScriptural.new.parse("Gen 1")
      expect(result.chapters).to eq [[1,1]]
    end
    it "parses a single book and chapter range" do
      result = ActsAsScriptural.new.parse("Gen 1-3")
      expect(result.chapters).to eq [[1,1],[1,2],[1,3]]
    end
    it "parses a single book and chapter range with ellipses" do
      result = ActsAsScriptural.new.parse("Gen 1..3")
      expect(result.chapters).to eq [[1,1],[1,2],[1,3]]
    end
    it "parses a book with spaces" do
      result = ActsAsScriptural.new.parse("1 John 1")
      expect(result.chapters).to eq [[62,1]]
    end
    it "parses multiple books in the reference" do
      result = ActsAsScriptural.new.parse("Gen 1, Matthew 1")
      expect(result.chapters).to eq [[1,1],[40,1]]
    end
    it "parses multiple books and chapter ranges in the reference" do
      result = ActsAsScriptural.new.parse("Gen 1-2, Matthew 1-2")
      expect(result.chapters).to eq [[1,1],[1,2],[40,1],[40,2]]
    end
    it "parses a book name with capitalization wonkiness" do
      result = ActsAsScriptural.new.parse("geNESis 1")
      expect(result.chapters).to eq [[1,1]]
    end
  end
  describe "#parse invalid references" do
    it "ignores chapter ranges that are not biblical" do
      result = ActsAsScriptural.new.parse("Jude 1-2")
      expect(result.chapters).to eq [[65,1]]
      result = ActsAsScriptural.new.parse("Jude 0-1")
      expect(result.chapters).to eq [[65,1]]
      result = ActsAsScriptural.new.parse("Jude 1-1")
      expect(result.chapters).to eq [[65,1]]
    end
  end
end
