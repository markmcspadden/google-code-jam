require 'test/unit'

require 'c'

class CCaseTest < Test::Unit::TestCase
  def setup
    @c = C.new("example_in")
  end
  
  def test_case_count
    assert_equal 2, @c.case_count
  end
  
  def test_cases
    assert_equal 2, @c.cases.size
    assert_equal ["4 8 16","1 20 5 2"], @c.cases.last
  end
  
  def test_input_and_output
    assert_equal File.read('example_out'), @c.output
  end
end