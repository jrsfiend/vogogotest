class Machine
	def initialize(filename)
		@filename = filename
		File.open(@filename, "w+") do |f|

		end
		valids = 0
		errors = 0 
		done = false
		def doillegals
			for i in 0..42
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
				line1 = []
				line2 = []
				line3 = []
					
				d.reverse.each_with_index do |val, index| 
					if val == 0 
						line1[index] = "   "
						line2[index] = " | "
						line3[index] = "_ |"
					elsif val == 1
						line1[index] = "   "
						line2[index] = "_ |"
						line3[index] = "  |"
					elsif val == 2
						line1[index] = " _ "
						line2[index] = "_| "
						line3[index] = "|_ "
					elsif val == 3
						line1[index] = " _ "
						line2[index] = " _|"
						line3[index] = " _|"
					elsif val == 4
						line1[index] = "   "
						line2[index] = "__|"
						line3[index] = "  |"
					elsif val == 5
						line1[index] = " _ "
						line2[index] = "|_ "
						line3[index] = " __"
					elsif val == 6
						line1[index] = " _ "
						line2[index] = "|_ "
						line3[index] = "__|"
					elsif val == 7
						line1[index] = " _ "
						line2[index] = "  |"
						line3[index] = "_ _"
					elsif val == 8
						line1[index] = " _ "
						line3[index] = "|_|"
						line3[index] = "__|"
					elsif val == 9
						line1[index] = " _ "
						line3[index] = "|_|"
						line3[index] = "__|"
					end
				end
				
				write(line1, line2, line3)
			end
		end
		while !done do
			if (valids + errors) >= 82
				done = true
				doillegals
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
			if ((1*d[0])+(2*d[1])+(3*d[2])+(4*d[3])+(5*d[4])+(6*d[5])+(7*d[6])+(8*d[7])+(9*d[8])) % 11 == 0
				line1 = []
				line2 = []
				line3 = []
				if valids <= 41
					
					d.reverse.each_with_index do |val, index| 
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
							line3[index] = "|_|"
							line3[index] = "|_|"
						elsif val == 9
							line1[index] = " _ "
							line3[index] = "|_|"
							line3[index] = " _|"
						end
					end
					
					write(line1, line2, line3)
					valids  = valids + 1
				end
			else
				line1 = []
				line2 = []
				line3 = []	
				if errors <= 41
					d.reverse.each_with_index do |val, index| 
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
							line3[index] = "|_|"
							line3[index] = "|_|"
						elsif val == 9
							line1[index] = " _ "
							line3[index] = "|_|"
							line3[index] = " _|"
						end
					end
				write(line1, line2, line3)
				errors = errors + 1
				end
			end
		end
	end
	def write(line1, line2, line3)
		File.open(@filename, "a+") do |f|
			line1.each { |element| f.write(element) }
			f.puts("\n")
			line2.each { |element| f.write(element) }
			f.puts("\n")
			line3.each { |element| f.write(element) }
			f.puts("\n")
			f.puts("\n")
		end
	end

end

puts "Let's write three test files that the machine would have output."
# they have errors, illegals and valids (almost equally dispersed)
Machine.new("test.txt")
Machine.new("test2.txt")
Machine.new("test3.txt")


