require 'jam'
require 'yaml'

class Solution
  include Jam

  @mapping = {}

  def output_string
    strings = []
    output.each_with_index{ |o,i| strings << "Case ##{i+1}: #{o}"}
    strings.join("\n")
  end

  def compute
    self.output = []

    cases.each do |kase|
      output << kase.to_s.chars.to_a.collect{ |c| self.class.mapping[c] }.join
    end
  end

  def run
    compute
    write
  end

  class << self
    def mapping
      if @mapping.empty?
        generate_mapping
      else
        @mapping
      end
    end

    def generate_mapping
      sources = File.read('A-test.in').split("\n")
      translated = File.read('A-test.out').split("\n")

      sources.shift # Remove number of cases
      translated.each{ |t| t.gsub!(/Case #\d*\: /,"") }

      sources.each_with_index do |source, idx|
        source_chars = source.chars.to_a

        translate = translated[idx]
        translate_chars = translate.chars.to_a

        source_chars.each_with_index do |c, idx2|
          if @mapping[c] && @mapping[c] != translate_chars[idx2]
            raise "ERROR in #{source} mapping. Trying to map source #{c} to translated #{translate_chars[idx2]} but is already #{@mapping[c]}"
          else
            @mapping[c] = translate_chars[idx2]
          end
        end

      end

      # Account for a missing link
      missing_sources = (("a".."z").to_a - @mapping.keys)
      missing_translates = (("a".."z").to_a - @mapping.values)
      if !missing_sources.empty?
        raise "BIG ISSUE" if missing_sources.size > 1 || missing_translates.size > 1
        
        @mapping[missing_sources.first] = missing_translates.first
      end

      @mapping
    end



  end
end