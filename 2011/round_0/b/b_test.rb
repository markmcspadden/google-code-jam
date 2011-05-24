require 'test/unit'
require 'b'

class BTest < Test::Unit::TestCase
  
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
  end
  
  def test_case_count
    assert_equal 5, @b.test_cases_count
  end
  
  def test_cases
    assert_equal "0 1 QW 2 QW", @b.test_cases.last
  end
  
  def test_output
    output = <<-EOS
Case #1: [E, A]
Case #2: [R, I, R]
Case #3: [F, D, T]
Case #4: [Z, E, R, A]
Case #5: []
    EOS
    
    assert_equal output.strip, @b.output
  end
  
end

class BTestCaseTest1 < Test::Unit::TestCase
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
    @b_test_case = BTestCase.new(@b.test_cases.first)
  end
  def test_combo_count
    assert_equal 0, @b_test_case.combo_count
  end
  def test_combos
    assert_equal [], @b_test_case.combos
  end
  def test_opposed_count
    assert_equal 0, @b_test_case.opposed_count
  end
  def test_opposeds
    assert_equal [], @b_test_case.opposeds
  end
  def test_invoke_count
    assert_equal 2, @b_test_case.invoke_count
  end
  def test_invokes
    assert_equal ["E","A"], @b_test_case.invokes
  end
  
  def test_output
    @b_test_case.run
    assert_equal "[E, A]", @b_test_case.output
  end
end

class BTestCaseTest2 < Test::Unit::TestCase
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
    @b_test_case = BTestCase.new(@b.test_cases[1])
  end
  def test_combo_count
    assert_equal 1, @b_test_case.combo_count
  end
  def test_combos
    assert_equal [["QR","I"]], @b_test_case.combos
  end
  def test_opposed_count
    assert_equal 0, @b_test_case.opposed_count
  end
  def test_opposeds
    assert_equal [], @b_test_case.opposeds
  end
  def test_invoke_count
    assert_equal 4, @b_test_case.invoke_count
  end
  def test_invokes
    assert_equal ["R","R","Q","R"], @b_test_case.invokes
  end
end

class BTestCaseTest3 < Test::Unit::TestCase
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
    @b_test_case = BTestCase.new(@b.test_cases[2])
  end
  def test_combo_count
    assert_equal 1, @b_test_case.combo_count
  end
  def test_combos
    assert_equal [["QF","T"]], @b_test_case.combos
  end
  def test_opposed_count
    assert_equal 1, @b_test_case.opposed_count
  end
  def test_opposeds
    assert_equal [["Q","F"]], @b_test_case.opposeds
  end
  def test_invoke_count
    assert_equal 7, @b_test_case.invoke_count
  end
  def test_invokes
    assert_equal %w(F A Q F D F Q), @b_test_case.invokes
  end
end

class BTestCaseTest4 < Test::Unit::TestCase
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
    @b_test_case = BTestCase.new(@b.test_cases[3])
  end
  def test_combo_count
    assert_equal 1, @b_test_case.combo_count
  end
  def test_combos
    assert_equal [["EE","Z"]], @b_test_case.combos
  end
  def test_opposed_count
    assert_equal 1, @b_test_case.opposed_count
  end
  def test_opposeds
    assert_equal [["Q","E"]], @b_test_case.opposeds
  end
  def test_invoke_count
    assert_equal 7, @b_test_case.invoke_count
  end
  def test_invokes
    assert_equal %w(Q E E E E R A), @b_test_case.invokes
  end
end

class BTestCaseTest5 < Test::Unit::TestCase
  def setup
    @b = B.new(File.expand_path(File.dirname(__FILE__) + '/example_input'))
    @b_test_case = BTestCase.new(@b.test_cases[4])
  end
  def test_combo_count
    assert_equal 0, @b_test_case.combo_count
  end
  def test_combos
    assert_equal [], @b_test_case.combos
  end
  def test_opposed_count
    assert_equal 1, @b_test_case.opposed_count
  end
  def test_opposeds
    assert_equal [["Q","W"]], @b_test_case.opposeds
  end
  def test_invoke_count
    assert_equal 2, @b_test_case.invoke_count
  end
  def test_invokes
    assert_equal %w(Q W), @b_test_case.invokes
  end
end