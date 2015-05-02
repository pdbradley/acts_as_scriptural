require 'spec_helper'

describe BibleInfo do
  describe "Instance Methods" do
    describe "#string_to_book_name(str) returns the name of the bible book when passed good input" do
      it "a valid book" do
        expect((BibleInfo.new).string_to_book_name('Genesis')).to eq "Genesis"
      end
      it "a lowercase book" do
        expect((BibleInfo.new).string_to_book_name('genesis')).to eq "Genesis"
      end
      it "a partial book" do
        expect((BibleInfo.new).string_to_book_name('gen')).to eq "Genesis"
      end
      it "a book with spaces and / or numbers" do
        expect((BibleInfo.new).string_to_book_name('1 Cor')).to eq "1 Corinthians"
      end
    end
    describe "books" do
      it "returns a Book when passed a valid integer index" do
        expect(BibleInfo.new.books[1]).to be_a Book
        expect(BibleInfo.new.books[1].book_name).to eq "Genesis"
        expect(BibleInfo.new.books[1].num_chapters).to eq 50
      end

    end
  end

end
