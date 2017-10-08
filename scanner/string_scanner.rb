class StringScanner

  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def eos?
    @string.empty?
  end

  def scan(regex)
    unless @string.empty? || @string.nil?
      match = @string[regex]
      if @string.start_with? match
        @string.sub!(match, '')
        match
      end
    end
  end
end
