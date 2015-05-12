require_relative 'bible'
require 'abbrev'


class ActsAsScriptural::AbbreviationLookup

  def initialize
    @hash = bible.book_names.abbrev.map{|k,v| [k.gsub(' ','').downcase,v]}.to_h
  end

  def fullname(str)
    @hash[str.gsub(' ','').downcase]
  end

  def index_number(str)
    bible.namehash[fullname(str)].index 
  end

  def bible
    @bible || ActsAsScriptural::Bible.new
  end

  def abbreviation_to_book(str)
    bible.namehash[fullname(str)]
  end

end
