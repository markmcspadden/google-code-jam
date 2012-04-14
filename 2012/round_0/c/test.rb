require 'test/unit'

require 'jam'

class JamTest < Test::Unit::TestCase

  class Me
    include Jam
  end

  def setup
    @solution = Me.new
    @solution.input_file = 'C-test.in'
  end

  def test_read
    @solution.read
    assert_equal File.read('C-test.in'), @solution.input
  end

  def test_read
    @solution.output_string = "Y U NO HAVE OUTPUT?"
    @solution.write
    assert_equal File.read('C-test.completed.out'), "Y U NO HAVE OUTPUT?"
  end

  def test_cases_count
    assert_equal 4, @solution.cases_count
  end

  def test_cases
    assert_equal ["1 9", "10 40", "100 500", "1111 2222"], @solution.cases
  end

end

require 'solution'

class SolutionTest < Test::Unit::TestCase

  def setup
    @solution = Solution.new
    @solution.input_file = 'C-test.in'
  end

  # def test_output
  #   @solution.compute
  #   assert_equal [0,3,156,287], @solution.output
  # end

  # def test_output_counts
  #   @solution.compute
  #   assert_equal [0,3,156,287], @solution.output_counts
  # end

  def test_output_clean
    @solution.compute
    assert_equal [0,3,156,287], @solution.output_clean
  end

  # Mostly just to ensure it runs fast enough
  def test_edge
    @solution.input_file = 'C-test-range.in'
    @solution.compute
    assert_equal [946], @solution.output_clean
  end

  def test_output_string
    @solution.compute
    assert_equal File.read('C-test.out'), @solution.output_string
  end

  def test_run
    @solution.run
    assert_equal File.read('C-test.completed.out'), @solution.output_string
  end

end

