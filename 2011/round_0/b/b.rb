class B
  
  attr_accessor :test_cases, :test_cases_count, :outputs
  
  def initialize(filename)
    @outputs = []
    
    inputs = File.read(filename).split("\n")
    
    @test_cases_count = inputs.first.to_i
    @test_cases = inputs[1..-1]
  end
  
  def run
    @test_cases.each_with_index do |tc, idx|
      tc = BTestCase.new(tc)
      @outputs << "Case ##{idx+1}: #{tc.output}"
    end
    
    @run = true
  end
  
  def output
    run unless @run
    @outputs.join("\n")
  end
  
end

class BTestCase
  
  attr_accessor :combo_count, :combos, 
                :opposed_count, :opposeds, 
                :invoke_count, :invokes, 
                :elements
  
  def initialize(string)
    @combos = []
    @opposeds = []
    @invokes = []
    @elements = []
    
    string_array = string.split(" ")
    
    @combo_count = string_array.delete_at(0).to_i
    if @combo_count != 0
      @combo_count.times{ @combos << string_array.delete_at(0) }
    end
    @combos = @combos.collect{ |c| [c.chars.to_a[0..1].join, c.chars.to_a.last] }
    
    @opposed_count = string_array.delete_at(0).to_i
    if @opposed_count != 0
      @opposed_count.times{ @opposeds << string_array.delete_at(0) }
    end
    @opposeds = @opposeds.collect{ |o| o.chars.to_a }
    
    @invoke_count = string_array.delete_at(0).to_i
    if @invoke_count != 0
      string_array.delete_at(0).chars.each{ |c| @invokes << c }
    end
  end
  
  def run
    @invokes.each_with_index do |i, idx|
      @elements << i
      
      unless idx == 0
      
        # Do the combos
        comboable = @elements[-2..-1]
        comboable1 = comboable.to_a.join
        comboable2 = comboable.to_a.reverse.join
      
        if combo = @combos.detect{ |c| c[0] == comboable1 || c[0] == comboable2 }
          @elements.pop
          @elements.pop
          @elements << combo[1]
        end
        
        # Do the opposeds
        if @opposeds.any?{ |o| o[0] == @elements.last && @elements.include?(o[1]) || o[1] == @elements.last && @elements.include?(o[0]) }
          @elements = []
        end
      
      end
    end
    
    @run = true
    @elements
  end
  
  def output
    run unless @run
    "[#{@elements.join(", ")}]"
  end
  
end