require_relative 'book'

class ActsAsScriptural::Bible

  attr_accessor :namehash, :indexhash

  def initialize
    # two lookup tables...not too DRY
    @namehash = Hash.new
    @indexhash = Hash.new
    import_from_file
  end

  def book_names
    @namehash.map{|k,v| v.name}
  end

  def chapter_exists?(book_index, chapter_number)
    @indexhash[book_index] && 
      chapter_number.between?(1, @indexhash[book_index].num_chapters) 
  end

  private

  def import_from_file
    File.readlines("data/acts_as_scriptural/english.txt").each do |line|
      book_name, book_index, num_chapters = line.chomp.split(',')
      book = ActsAsScriptural::Book.new(book_name, book_index.to_i, num_chapters.to_i)
      @namehash[book_name] = book
      @indexhash[book_index.to_i] = book
    end
  end
end
