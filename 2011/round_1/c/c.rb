require 'rational'

def lcm(*args)
  args.inject(1) do |m, n|
    next 0 if m == 0 or n == 0
    i = m
    loop do
      break i if i % n == 0
      i += m
    end
  end
end

class C
  attr_accessor :input_file, :output_file, :case_count, :cases, :results
  
  def initialize(input_file)
    @input = input_file
    @output_file = input_file + "_output_#{Time.now.to_f}"
    
    lines = File.read(@input).split("\n")
    
    @case_count = lines.delete_at(0).to_i
    @cases = []
    
    lines.each_with_index do |line, idx|
      next if idx%2 == 1
      @cases << lines[idx..idx+1]
    end
    
    self.run
  end
  
  def run
    cases.each do |c|
      line_1 = c[0].split(" ").collect{ |i| i.to_i }
      line_2 = c[1].split(" ").collect{ |i| i.to_i }
      
      others = line_1[0]
      lowest = line_1[1]
      highest = line_1[2]
      
      result = "NO"
      
      least = lcm(line_2)
      gcds = []
      
      
      (lowest..highest).to_a.each do |i|
        
      end
    end
  end
  
  def output
    File.open(output_file, "w+") do |f| 
      results.each_with_index do |c,idx|
        f.puts "" unless idx == 0
        f.puts "Case ##{idx+1}: #{c.to_s}"
      end
    end
    File.read(output_file)
  end
  
end

class CCase
  
end