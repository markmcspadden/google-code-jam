require 'jam'

class Solution
  include Jam

  def output
    @output ||= {}
  end

  def output_counts
    @output.inject({}){ |hash,kase| hash.merge!({ kase.first => kase.last.count }) }
  end

  def output_clean
    cases.collect do |kase|
      start_digit, end_digit, key = case_setup(case_array(kase))
      output_counts[key]
    end
  end

  def output_string
    strings = []
    output_clean.each_with_index{ |o,i| strings << "Case ##{i+1}: #{o}"}
    strings.join("\n")
  end

  # PLEASE MAKE CASE A CLASS
  def case_setup(array)
    start_digit = array.first.to_i
    end_digit = array.last.to_i

    key = "#{start_digit} - #{end_digit}"
    [start_digit, end_digit, key]
  end

  def case_array(kase)
    kase.split(" ")
  end

  def compute
    cases.each do |kase|
      start_digit, end_digit, key = case_setup(case_array(kase))

      self.output[key] = []

      range = (start_digit..end_digit)

      range.each do |i|
        puts "^^^^^^^^^^^^"
        puts i

        chars = i.to_s.chars.to_a
        start = chars.dup
        aug = []
        until aug == chars
          aug = start if aug.empty?

          aug_i = aug.join.to_i
          if i != aug_i && !self.output[key].include?(aug_i) && range.include?(aug_i)
            puts "MATCH #{i} and #{aug_i}"
            self.output[key] << i
          end

          move = start.shift
          aug = start
          aug << move
        end
      end
    end
  end

  def run
    compute
    write
  end

end