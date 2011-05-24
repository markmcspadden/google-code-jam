require 'test/unit'

require 'a'

class ATest < Test::Unit::TestCase
  
  def setup
    @a = A.new("example_in")
  end
  
  def test_case_count
    assert_equal 3, @a.case_count
  end
  
  def test_cases
    assert_equal 3, @a.cases.size
  end
  
  def test_input_and_output
    assert_equal File.read('example_out'), @a.output
  end
  
end

class ACaseTest < Test::Unit::TestCase
  
  def test_no_blue
    a_case = ACase.new(["..",".."])
    assert_equal "..\n..", a_case.substitute.to_s
  end
  
  def test_no_blue_2
    a_case = ACase.new(["."])
    assert_equal ".", a_case.substitute.to_s
  end
  
  def test_blue_not_divisible_by_four
    a_case = ACase.new(["..","..###"])
    assert_equal "Impossible", a_case.substitute.to_s
  end

  def test_blue_with_impossible_structure
    a_case = ACase.new([".#...","..##.","..###",".##.."])
    assert_equal "Impossible", a_case.substitute.to_s
  end
  
  def test_blue_with_red_sub
    a_case = ACase.new([".##..",".####",".####",".##.."])
    assert_equal "./\\..\n.\\//\\\n./\\\\/\n.\\/..", a_case.substitute.to_s
  end
  
end