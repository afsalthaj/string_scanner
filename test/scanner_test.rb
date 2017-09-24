require 'test/unit'
require '../scanner/string_scanner'
class ScannerSpec < Test::Unit::TestCase
  def test_if_eos_is_nil_when_scanner_is_initialised_with_an_empty_string
    example_string = ""
    scanner = StringScanner.new(example_string)
    assert_equal(scanner.eos?, true)
  end

  def test_if_eos_is_false_when_scanner_is_initialised_with_a_space
    example_string = " "
    scanner = StringScanner.new(example_string)
    assert_equal(scanner.eos?, false)
  end

  def test_if_eos_is_false_when_scanner_is_initialised_with_a_string
    example_string = "This is an example string"
    scanner = StringScanner.new(example_string)
    assert_equal(scanner.eos?, false)
  end

  def test_if_eos_is_true_if_string_scan_is_complete
    example_string="a"
    scanner = StringScanner.new(example_string)
    scanner.scan
    assert_equal(scanner.eos?, true)
  end
end
