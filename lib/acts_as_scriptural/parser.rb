class ActsAsScriptural::Parser
  require 'ostruct'

  def parse_reference(reference)
    result = ParsedReference.new
    # this reference needs to have no spaces to be parsed properly;
    # the matches will contain (if applicable)
    # match 1: first book name
    # match 2: first chapter
    # match 3: second book name (if present)
    # match 4: last chapter
    regex = /^([0-9]?[a-zA-Z]+)\.?([0-9]+)(?:-|..)?(?:([0-9]?[a-zA-Z]+)?\.?([0-9]+))?/
    match = reference.gsub(/\s+/,'').match(regex)
    if match
      if (match[3].nil? && match[4].nil?)  # only one chapter
        result.first_book = match[1]
        result.last_book = match[1]
        result.first_chapter = match[2].to_i
        result.last_chapter = match[2].to_i
      elsif match[3]  # the range must include two books
        result.first_book = match[1]
        result.last_book = match[3]
        result.first_chapter = match[2].to_i
        result.last_chapter = match[4].to_i
      else  # just one book in the range
        result.first_book = match[1]
        result.last_book = match[1]
        result.first_chapter = match[2].to_i
        result.last_chapter = match[4].to_i
      end
        result.first_book_index = ActsAsScriptural::AbbreviationLookup.new.index_number(result.first_book)
        result.last_book_index = ActsAsScriptural::AbbreviationLookup.new.index_number(result.last_book)
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
