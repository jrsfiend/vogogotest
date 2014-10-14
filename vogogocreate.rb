class Machine
	def write(d, which, filename)
		line1 = []
		line2 = []
		line3 = []
		d.each_with_index do |val, index| 
			if val == 0 
				line1[index] = " _ "
				line2[index] = "| |"
				line3[index] = "|_|"
			elsif val == 1
				line1[index] = "   "
				line2[index] = "  |"
				line3[index] = "  |"
			elsif val == 2
				line1[index] = " _ "
				line2[index] = " _|"
				line3[index] = "|_ "
			elsif val == 3
				line1[index] = " _ "
				line2[index] = " _|"
				line3[index] = " _|"
			elsif val == 4
				line1[index] = "   "
				line2[index] = "|_|"
				line3[index] = "  |"
			elsif val == 5
				line1[index] = " _ "
				line2[index] = "|_ "
				line3[index] = " _|"
			elsif val == 6
				line1[index] = " _ "
				line2[index] = "|_ "
				line3[index] = "|_|"
			elsif val == 7
				line1[index] = " _ "
				line2[index] = "  |"
				line3[index] = "  |"
			elsif val == 8
				line1[index] = " _ "
				line2[index] = "|_|"
				line3[index] = "|_|"
			elsif val == 9
				line1[index] = " _ "
				line2[index] = "|_|"
				line3[index] = " _|"
			end
		end
		if @valids > @illegals
			random = rand(9)
			line1[random] = "|||"
			@illegals = @illegals + 1
		else
			if which == "valids" 
				@valids  = @valids + 1
			elsif which == "errors"
				@errors = @errors + 1
			end
		end
		File.open(filename, "a+") do |f|
			line1.each { |element| f.write(element) }
			f.puts("\n")
			line2.each { |element| f.write(element) }
			f.puts("\n")
			line3.each { |element| f.write(element) }
			f.puts("\n")
			f.puts("\n")
		end
	end
	def initialize(filename)
		@errors = 0
		@valids = 0
		@illegals = 0
		File.open(filename, "w+") do |f|

		end
		done = false
		while !done do
			if (@valids + @errors + @illegals) >= 125
				done = true
			end

			d = []
			d[8] = rand(9)
			d[7] = rand(9)
			d[6] = rand(9)
			d[5] = rand(9)
			d[4] = rand(9)
			d[3] = rand(9)
			d[2] = rand(9)
			d[1] = rand(9)
			d[0] = rand(9)
			if ((1*d[8])+(2*d[7])+(3*d[6])+(4*d[5])+(5*d[4])+(6*d[3])+(7*d[2])+(8*d[1])+(9*d[0])) % 11 == 0
				
				if @valids <= 41
					write(d, "valids", filename)
				end
			else
				line1 = []
				line2 = []
				line3 = []	
				if @errors <= 41 and @valids > @errors
					write(d, "errors", filename)
				end
			end
		end
	end

end

puts "Let's write three test files that the machine would have output."
# they have errors, illegals and valids (almost equally dispersed)
Machine.new("test.txt")
Machine.new("test2.txt")
Machine.new("test3.txt")


