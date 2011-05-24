file_name = "dummy.in"
# file_name = "A-small.in"
# file_name = "A-large.in"
input = File.read(File.expand_path(File.dirname(__FILE__) + "/#{file_name}"))
output = []

lines = input.split("\n")

test_cases = lines.delete_at(0).to_i

bases

lines.each_with_index do |line, idx|
  puts "===CASE #{idx+1}"
  
  ints = line.split(" ").collect{ |i| i.to_i }
  snappers = ints[0]
  snaps = ints[1]
  
  puts "Snappers #{snappers}"
  puts "Snaps #{snaps}"
  
  if snaps > 0
    if snappers == 1
      output << "Case ##{idx+1}: " + (snaps%2 == 0 ? "OFF" : "ON")
    elsif snaps <= snappers
      output << "Case ##{idx+1}: OFF"
    else
      light = "OFF"  
      snappers_base = base_2_base[snappers-1]
      
      inc = 1
      while 
        
      end
      
      output << "Case ##{idx+1}: #{light}"

      # Looks like x^3 - x^2 - 1 will do the trick
      # def plot(s)
      #   (s*s*s - s*s - 1)
      # end
      # base = plot(snappers)
      # puts base
      # light = "OFF"
      # if base == snaps
      #   light = "ON"
      # else
      #   inc = 1
      #   new_base = base
      #   while new_base <= snaps
      #     puts plot(snappers+inc)
      #     if plot(snappers+inc) == snaps
      #       light = "ON"
      #     end 
      #     inc += 1
      #     new_base = plot(snappers*inc)
      #   end
      # end
      # 
      # output << "Case ##{idx+1}: #{light}"
      # [state, power]
      # chain = [[0,1]]
      # (1..snappers-1).each { chain << [0.0] }
      #   
      # (1..snaps).each do |snap|
      #   puts "=== SNAP #{snap}"
      #   # Change the state of any powered snappers
      #   chain.each do |s| 
      #     if s[1] == 1
      #       s[0] = (s[0] == 1 ? 0 : 1) 
      #     end
      #     puts "== State #{s[0]}"
      #   end
      #     
      #   # Change the power status of the snappers
      #   full_power = true
      #   power_idx = 1
      #       
      #   while full_power && (power_idx <= chain.size-1)
      #     puts "== Check Power on Chain #{power_idx}"
      #     if chain[power_idx-1][1] == 1 && chain[power_idx-1][0] == 1
      #       chain[power_idx][1] = 1
      #     else
      #       (power_idx..chain.size-1).each { |i| chain[i][1] = 0 }
      #       full_power = false
      #     end
      #     puts "== POWER #{chain[power_idx][1]}"
      #     power_idx += 1
      #   end
      # end
      # output << "Case ##{idx+1}: " + (chain.any?{ |s| s != [1,1] } ? "OFF" : "ON")
    end
  else
    output << "Case ##{idx+1}: OFF"
  end
end 

File.open(File.expand_path(File.dirname(__FILE__) + "/#{file_name}.out"), "wb+") { |f| f << output.join("\n") }

puts output.join("\n")