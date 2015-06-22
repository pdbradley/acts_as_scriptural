class ActsAsScriptural::Parser
  require 'ostruct'

  def self.book_and_chapters_from_reference(reference)
    result = OpenStruct.new
    regex = /^\s*([0-9]?\s*[a-zA-Z]+)\.?\s*([0-9]+)(?:\s*(?:-|..)[^0-9]*([0-9]+))?/
    match = reference.match(regex)
    if match
      if match[3]
        result.chapters = (match[2]..match[3]).to_a
      else
        result.chapters = [ match[2] ]
      end
        result.start_book = match[1]
        result.book_index = ActsAsScriptural::AbbreviationLookup.new.index_number(result.start_book)
        result.chapters.map!(&:to_i)
        result
    else
      nil
    end
  end


end


#^\s*  whitespace
#([0-9]?\s*[a-zA-Z]+)\.?  bookname match[1]
#\s* whitespace
#([0-9]+) number match[2] 
#(?:\s*(?:-|..)[^0-9]*([0-9]+))
#?/
