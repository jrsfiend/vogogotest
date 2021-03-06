class Machine
	def write(d, which)
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
	def initialize(filename)
		@errors = 0
		@valids = 0
		@illegals = 0
		@filename = filename
		File.open(@filename, "w+") do |f|

		end
	end
	def create
		done = false
		while !done do
			if (@valids + @errors + @illegals) >= 500
				done = true
			end

			d = []
			for i in 0..8
				d[i] = rand(9)
			end
			if ((1*d[8])+(2*d[7])+(3*d[6])+(4*d[5])+(5*d[4])+(6*d[3])+(7*d[2])+(8*d[1])+(9*d[0])) % 11 == 0
				if @valids <= 175
					write(d, "valids")
				end
			else
				line1 = []
				line2 = []
				line3 = []	
				if @errors <= 175 and @valids > @errors
					write(d, "errors")
				end
			end
		end
	end
end

puts "Let's write three test files that the machine would have output."
# they have errors, illegals and valids (almost equally dispersed)

test = Machine.new("test.txt")
test.create

test2 = Machine.new("test2.txt")
test2.create

test3 = Machine.new("test3.txt")
test3.create