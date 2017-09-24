class StringScanner
  def initialize(string)
    @string = string
    @scan_pointer = 0
    @matched_string=[]
  end

  def eos?
    @scan_pointer == @string.length
  end

  def scan
    @scan_pointer+=1
  end
end
