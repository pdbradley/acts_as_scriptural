class ActsAsScriptural::Parser

  def self.book_and_chapters_from_reference(reference)
    regex = /^\s*([0-9]?\s*[a-zA-Z]+)\.?\s*([0-9]+)(?:\s*(?:-|..)[^0-9]*([0-9]+))?/
    match = reference.match(regex)
    if match
      if match[3]
        chapters = (match[2]..match[3]).to_a
      else
        chapters = [ match[2] ]
      end
      [ match[1], chapters.map(&:to_i) ]
    else
      [nil, nil]
    end
  end
end
