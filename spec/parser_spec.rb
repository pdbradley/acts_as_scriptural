require 'spec_helper'

describe ActsAsScriptural::Parser do
  it "correctly parses a single chapter" do
    result = ActsAsScriptural::Parser.new.parse_reference("Gen 1")

    expect(result.first_book_index).to eq 1
    expect(result.first_chapter).to eq 1
    expect(result.last_book_index).to eq 1
    expect(result.last_chapter).to eq 1
  end
  it "correctly parses a chapter range with ellipses from one book " do
    result = ActsAsScriptural::Parser.new.parse_reference("Gen 1..3")

    expect(result.first_book_index).to eq 1
    expect(result.first_chapter).to eq 1
    expect(result.last_book_index).to eq 1
    expect(result.last_chapter).to eq 3
  end
  it "correctly parses a chapter range with a dash from one book " do
    result = ActsAsScriptural::Parser.new.parse_reference("Gen 1-3")

    expect(result.first_book_index).to eq 1
    expect(result.first_chapter).to eq 1
    expect(result.last_book_index).to eq 1
    expect(result.last_chapter).to eq 3
  end
  it "correctly parses a chapter range with a dash from two books " do
    result = ActsAsScriptural::Parser.new.parse_reference("Gen 1-Mat 28")

    expect(result.first_book_index).to eq 1
    expect(result.first_chapter).to eq 1
    expect(result.last_book_index).to eq 40
    expect(result.last_chapter).to eq 28
  end
end
