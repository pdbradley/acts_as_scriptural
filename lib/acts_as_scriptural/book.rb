class ActsAsScriptural::Book

  def initialize(name, index, num_chapters)
    @name = name
    @index = index
    @num_chapters = num_chapters
  end

  attr_accessor :name, :index, :num_chapters

end
