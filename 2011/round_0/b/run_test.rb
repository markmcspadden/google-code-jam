require 'test/unit'

class RunTest < Test::Unit::TestCase
  
  def setup
    `ruby run.rb example_input`
    @output_filename = Dir.glob("output_*").last
  end
  
  def test_output
    assert_equal File.read('example_output'), File.read(@output_filename)
  end
  
end