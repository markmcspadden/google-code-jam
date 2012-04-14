module Jam

  attr_accessor :input, :output, :output_string, :input_file, :output_file, :input_array
  attr_accessor :cases, :cases_count

  def input
    @input ||= self.read
  end

  def cases
    return @cases unless @cases.nil?

    all = self.input.split("\n")
    @cases_count = all.shift.to_i
    @cases = all
  end

  def cases_count
    return @cases_count unless @cases.nil?

    self.cases
    @cases_count
  end

  def read
    @input ||= File.read(File.dirname(__FILE__) + "/#{input_file}")
  end

  def output_file
    @output_file ||= input_file.gsub(".in",".completed.out")
  end

  def write
    File.open(output_file, "w+") { |f| f << output_string }
  end

end