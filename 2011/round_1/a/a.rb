class A
  attr_accessor :input_file, :output_file, :case_count, :cases
  
  def initialize(input_file)
    @input = input_file
    @output_file = input_file + "_output_#{Time.now.to_f}"
    
    lines = File.read(@input).split("\n")
    
    @case_count = lines.delete_at(0).to_i
    @cases = []
    
    lines.each_with_index do |line, idx|
      case_lines_count = line.split(" ").first.to_i
      case_lines = lines.slice!(idx+1, case_lines_count)
      
      @cases << ACase.new(case_lines)
    end
    
    self.run
  end
  
  def run
    cases.each{ |c| c.substitute }
  end
  
  def output
    File.open(output_file, "w+") do |f| 
      cases.each_with_index do |c,idx|
        f.puts "" unless idx == 0
        f.puts "Case ##{idx+1}:"
        f << c.to_s
      end
    end
    File.read(output_file)
  end
  
end

class ACase
  attr_accessor :lines, :blue_count, :possible
  
  def initialize(lines)
    @lines = lines
    @blue_count = 0

    if !@lines.join("").scan("#").empty?
      @lines.each{ |l| @blue_count += l.scan("#").size }
    end
    
    @possible = @blue_count%4 == 0 ? true : false
  end
  
  def to_s
    if self.possible
      lines.join("\n")
    else
      "Impossible"
    end
  end
  
  def substitute
    if blue_count != 0 && possible
      lines.each_with_index do |line, idx|
        next unless line.index("#")
        
        if line.index("#") != line.index("##") || lines[idx+1].to_s.slice(line.index("##"),2) != "##"
          self.possible = false
          break
        else
          while line_index = line.index("##")
            line[line_index,2] = "/\\"
            lines[idx+1][line_index,2] = "\\/"
          end
        end
        
        if !line.scan("#").empty?
          self.possible = false
          break
        end
      end
    end
    
    self.to_s
  end
  
end