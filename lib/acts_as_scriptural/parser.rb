class ActsAsScriptural::Parser
  require 'ostruct'

  def self.parse_reference(reference)
    result = OpenStruct.new
    regex = /^\s*([0-9]?\s*[a-zA-Z]+)\.?\s*([0-9]+)(?:\s*(?:-|..)[^0-9]*([0-9]+))?/
    match = reference.match(regex)
    if match
      if match[3]
        result.first_book = match[1]
        result.last_book = match[1]
        result.first_chapter = match[2].to_i
        result.last_chapter = match[3].to_i
      else
        result.first_book = match[1]
        result.last_book = match[1]
        result.first_chapter = match[2].to_i
        result.last_chapter = match[2].to_i
      end
        result.first_book_index = ActsAsScriptural::AbbreviationLookup.new.index_number(result.first_book)
        result.last_book_index = ActsAsScriptural::AbbreviationLookup.new.index_number(result.first_book)
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
