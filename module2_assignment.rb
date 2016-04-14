class LineAnalyzer
	attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
	
	def initialize(content, line_number)
		@content = content
        @line_number =line_number
        calculate_word_frequency
        
	end

	def calculate_word_frequency
        highest_wf_count = Hash.new(0)
        content.split.each do |word|
            highest_wf_count[word] += 1
        end
        
        highest_wf_words = highest_wf_count.select {|k,v| v == highest_wf_count.values.max }
        @highest_wf_count , @highest_wf_words = highest_wf_words.values.max , highest_wf_words.keys 

    end
    
end

class Solution 
    attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
    def initialize()
        @analyzers = []
        
    end

    def analyze_file()
        @LineAnalyzers = []
        @Line_numbers = []
        @max_frequency=[] 
        counter = 1
        File.foreach('test.txt') do |line|
            @LineAnalyzers = line
            @analyzers.push(@LineAnalyzers)
            @Line_numbers.push(counter)
            #cal_high_freq =  LineAnalyzer.new(@analyzers[0],1)
            #@max_frequency = cal_high_freq.calculate_word_frequency
            counter=counter+1
        end 
            
            @analyzers.each do |element|
                cal_high_freq =  LineAnalyzer.new(element,1)
                @max_frequency = cal_high_freq.calculate_word_frequency
                p @max_frequency
            end     
            #cal_high_freq =  LineAnalyzer.new(@analyzers[0],1)
            #@max_frequency = cal_high_freq.calculate_word_frequency
        p @analyzers, @Line_numbers, @max_frequency 

    end

    def calculate_line_with_highest_frequency()
        highest_count_across_lines ＝ 0
        @highest_count_words_across_lines = []
        



    end 

    def print_highest_word_frequency_across_lines()
        puts "The following words have the highest word frequency per line:"
        self.highest_count_words_across_lines.each do |highest_per_line|
           puts "#{highest_per_line.highest_wf_words} (appears in line #{highest_per_line.line_number})" 
        end 
    end





end

abc = []
counter = 0 
File.foreach('test.txt') do |line| 
    @LineAnalyz = line.split    
    abc.push(@LineAnalyz)
    counter +=1
    end










#LineAnalyzer1 = LineAnalyzer.new("This is a really really really cool cool you you you",1)
#puts LineAnalyzer1.calculate_word_frequency
LineAnalyzer2 = Solution.new
#puts LineAnalyzer2.calculate_line_with_highest_frequency
LineAnalyzer2.analyze_file

