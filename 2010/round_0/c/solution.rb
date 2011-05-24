# file_name = "dummy.in"
# file_name = "C-small.in"
file_name = "C-large.in"
input = File.read(File.expand_path(File.dirname(__FILE__) + "/#{file_name}"))
output = []

lines = input.split("\n")

test_cases = lines[0].to_i

(0..test_cases-1).each do |test_case|
  puts "===TEST CASE ##{test_case+1}"
  coaster = lines[2*test_case+1].split(" ").collect{ |i| i.to_i }
  groups = lines[2*test_case+2].split(" ").collect{ |i| i.to_i }

  run_times = coaster[0]
  people_per_run = coaster[1]
  
  total_riders = 0
  
  (0..run_times-1).each do |run|
    current_riders = 0
    current_groups = []
    
    while current_riders < people_per_run && !groups.empty? && ((groups[0] + current_riders) <= people_per_run)
      g = groups.delete_at(0)
      current_riders += g
      current_groups << g
    end
    
    groups = groups + current_groups 
    total_riders += current_riders
  end
  
  output << "Case ##{test_case+1}: #{total_riders}"
end

File.open(File.expand_path(File.dirname(__FILE__) + "/#{file_name}.out"), "wb+") { |f| f << output.join("\n") }

puts output.join("\n")

