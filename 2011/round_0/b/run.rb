require 'b'

filename = ARGV.first

@b = B.new(filename)

File.open("output_#{Time.now.to_f}", "w+") do |file|
  file << @b.output
end