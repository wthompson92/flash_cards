class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read
    File.read(@filename)
  end

  def by_line
    read.split(/\n/)
  end


  def by_comma
    by_line.map do |line|
    line.split(",")
    end
  end

  def cards
    by_comma.map do |content|
      question = content[0]
      answer = content[1]
      category = content[2].to_sym
    Card.new(question, answer, category)
    end
  end
end
