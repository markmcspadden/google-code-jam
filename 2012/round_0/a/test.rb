require 'test/unit'

require 'jam'

class JamTest < Test::Unit::TestCase

  class Me
    include Jam
  end

  def setup
    @solution = Me.new
    @solution.input_file = 'A-test.in'
  end

  def test_read
    @solution.read
    assert_equal File.read('A-test.in'), @solution.input
  end

  def test_read
    @solution.output_string = "Y U NO HAVE OUTPUT?"
    @solution.write
    assert_equal File.read('A-test.completed.out'), "Y U NO HAVE OUTPUT?"
  end

  def test_cases_count
    assert_equal 4, @solution.cases_count
  end

  def test_cases
    cases = ["y qee",
                  "ejp mysljylc kd kxveddknmc re jsicpdrysi",
                  "rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd",
                  "de kr kd eoya kw aej tysr re ujdr lkgc jv"]
    assert_equal cases, @solution.cases
  end

end

require 'solution'

class SolutionTest < Test::Unit::TestCase

  def setup
    @solution = Solution.new
    @solution.input_file = 'A-test.in'
  end

  def test_mapping
    mapping = Solution.generate_mapping
    assert !("a".."z").any?{ |c| !mapping.keys.include?(c) }
    assert_equal 27, mapping.size # Spaces included
  end

  def test_output
    @solution.compute
    assert_equal ["a zoo",
                  "our language is impossible to understand",
                  "there are twenty six factorial possibilities",
                  "so it is okay if you want to just give up"], @solution.output
  end

  def test_output_string
    @solution.compute
    assert_equal File.read('A-test.out'), @solution.output_string
  end

  def test_run
    @solution.run
    assert_equal File.read('A-test.completed.out'), @solution.output_string
  end

end

