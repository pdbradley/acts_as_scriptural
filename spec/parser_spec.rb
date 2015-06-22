require 'spec_helper'

describe ActsAsScriptural::Parser do
  it "correctly parses a single chapter" do
    result = ActsAsScriptural::Parser.parse_reference("Gen 1")

    expect(result.first_book_index).to eq 1
    expect(result.first_chapter).to eq 1
    expect(result.last_book_index).to eq 1
    expect(result.last_chapter).to eq 1
  end
end
