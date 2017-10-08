require 'test/unit'
require '../scanner/string_scanner'

class ScannerSpec < Test::Unit::TestCase
  def test_if_eos_is_nil_when_scanner_is_initialised_with_an_empty_string
    example_string = ""
    scanner = StringScanner.new(example_string)
    assert_equal(scanner.eos?, true)
  end

  def test_if_scan_gives_the_first_element_when_matched_with_word
    example_string = "This is an example string"
    scanner = StringScanner.new(example_string)
    value = scanner.scan(/\w+/)
    assert_equal(value, "This")
  end

  def test_if_scan_deletes_the_matched_pattern_from_the_string_beginning
    example_string = "This is an example_string"
    scanner = StringScanner.new(example_string)
    scanner.scan(/\w+/)
    assert_equal(scanner.string, " is an example_string")
  end

  def test_if_scan_returns_space_if_matched_with_a_space_pattern_after_word_match
    example_string = "This is an example_string"
    scanner = StringScanner.new(example_string)
    scanner.scan(/\w+/)
    value = scanner.scan(/\s+/)
    assert_equal(value, " ")
  end

  def test_if_scan_scans_a_complete_string_and_reaches_the_end_of_string
    example_string = "This is an example string"
    scanner = StringScanner.new(example_string)
    assert_equal(scanner.eos?, false)
    assert_equal(scanner.scan(/\w+/), "This")
    assert_equal(scanner.scan(/\w+/), nil)
    assert_equal(scanner.scan(/\s+/), " ")
    assert_equal(scanner.scan(/\s+/), nil)
    assert_equal(scanner.scan(/\w+/), "is")
    assert_equal(scanner.eos?, false)
    assert_equal(scanner.scan(/\s+/), " ")
    assert_equal(scanner.scan(/\w+/), "an")
    assert_equal(scanner.scan(/\s+/), " ")
    assert_equal(scanner.scan(/\w+/), "example")
    assert_equal(scanner.scan(/\s+/), " ")
    assert_equal(scanner.scan(/\w+/), "string")
    assert_equal(scanner.eos?, true)
    assert_equal(scanner.string, "")
    assert_equal(scanner.scan(/\s+/), nil)
    assert_equal(scanner.scan(/\w+/), nil)
  end
end
