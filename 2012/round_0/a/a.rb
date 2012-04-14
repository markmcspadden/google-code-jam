require 'solution'

filename = ARGV[0]
puts "Starting on #{filename}"

@solution = Solution.new
@solution.input_file = filename
@solution.run

puts "Finished. Results at #{@solution.output_file}"