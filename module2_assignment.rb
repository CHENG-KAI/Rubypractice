class LineAnalyzer
	attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
	
	def initialize(content, line_number)
		@content = content
        @line_number =line_number
        calculate_word_frequency
        
	end

	def calculate_word_frequency
        highest_wf_count = Hash.new(0)
        content.downcase.split.each do |word|
            highest_wf_count[word] += 1
        end
        
        highest_wf_words = highest_wf_count.select {|k,v| v == highest_wf_count.values.max }
        @highest_wf_count , @highest_wf_words = highest_wf_words.values.max , highest_wf_words.keys 
        
    end
    
end

class Solution 
    attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
    def initialize()
        @analyzers = Array.new
        
    end

    def analyze_file()
        @LineAnalyzers = Array.new
        @Line_numbers = Array.new
        @max_num=[]
        #counter = 1
        File.foreach('test.txt') do |line|
            @LineAnalyzers = line.chomp
            @analyzers.push(@LineAnalyzers)
            #@Line_numbers.push(counter)
            #counter=counter+1

        end


            
            @analyzers.each do |element|
                cal_high_freq =  LineAnalyzer.new(element,0)
                @max_frequency = cal_high_freq.calculate_word_frequency
                @max_num.push(@max_frequency) 
                
                
            end     
        #p @analyzers, @Line_numbers, @max_frequency ,@max_num
         #p @LineAnalyzers
         #p analyzers
         #p @max_frequency
         #p @max_num
         
         

    end

    def calculate_line_with_highest_frequency()    
        analyze_file
        @highest_count_words_across_lines=Array.new
        @highest_count_across_lines=Array.new

        @max_num.each do |core|
             
             @highest_count_words_across_lines.push(core.pop)
             @highest_count_across_lines.push(core.shift)
             
        end

        @highest_count_across_lines=@highest_count_across_lines.max
        
        
        
        
        

    end 

    def print_highest_word_frequency_across_lines()
        calculate_line_with_highest_frequency
        puts "The following words have the highest word frequency per line:"
        
        #p @highest_count_words_across_lines
        count = 1
        @highest_count_words_across_lines.each do |ulines|
        puts "#{ulines} (appears in line #{count})" 
        count +=1
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
#p LineAnalyzer1.calculate_word_frequency
LineAnalyzer2 = Solution.new
#puts LineAnalyzer2.calculate_line_with_highest_frequency
#LineAnalyzer2.analyze_file
#LineAnalyzer2.calculate_line_with_highest_frequency
LineAnalyzer2.print_highest_word_frequency_across_lines
#p LineAnalyzer2.highest_count_words_across_lines