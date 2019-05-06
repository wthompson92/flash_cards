class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read
    File.read(@filename)
  end

  def to_lines
    read.split(/\n/)
  end


  def each_line
    to_lines.map do |line|
    line.split(",")
    end
  end

  def cards
    each_line.map do |content|
      question = content[0]
      answer = content[1]
      category = content[2].to_sym
    Card.new(question, answer, category)
    end
  end
end
