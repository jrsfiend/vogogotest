class Read

	def initialize(filename)
		z = 0
		ills = 0
		nice = 0
		errs = 0
		account = []
		line1 = []
		line2 = []
		line3 = []
		File.readlines(filename).each do |line|
			if z == 0
				for i in 0..8
					line1[i] = line[i * 3..i * 3 + 2]
				end
			elsif z == 1
				for i in 0..8
					line2[i] = line[i * 3..i * 3 + 2]
				end
			elsif z == 2
				for i in 0..8
					line3[i] = line[i * 3..i * 3 + 2]
				end
			elsif z == 3
				for i in 0..8

					if line1[i] == " _ " and line2[i] == "| |" and line3[i] == "|_|"
						account[i] = 0
					elsif line1[i] == "   " and line2[i] == "  |"  and line3[i] == "  |"
						account[i] = 1
					elsif line1[i] == " _ " and line2[i] == " _|" and line3[i] == "|_ "
						account[i] = 2
					elsif line1[i] == " _ " and line2[i] == " _|" and line3[i] == " _|"
						account[i] = 3
					elsif line1[i] == "   " and line2[i] == "|_|" and line3[i] == "  |"
						account[i] = 4
					elsif line1[i] == " _ " and line2[i] == "|_ " and line3[i] == " _|"
						account[i] = 5
					elsif line1[i] == " _ " and line2[i] == "|_ " and line3[i] == "|_|"
						account[i] = 6
					elsif line1[i] == " _ " and line2[i] == "  |" and line3[i] == "  |"
						account[i] = 7
					elsif line1[i] == " _ " and line2[i] == "|_|" and line3[i] == "|_|"
						account[i] = 8
					elsif line1[i] == " _ " and line2[i] == "|_|" and line3[i] == " _|"
						account[i] = 9
					else
						account[i] = "?"
					end
				end
				if account.include? "?" 
					account.each { |x| print x }
					puts " ILL"
					ills = ills + 1
				elsif ((9*account[0]) + (8*account[1]) + (7*account[2]) + (6*account[3]) + (5*account[4]) + (4*account[5]) + (3*account[6]) + (2*account[7]) + (1*account[8])) % 11 == 0
					account.each { |x| print x }
					nice = nice + 1
					puts ""
				else
					account.each { |x| print x }
					errs = errs + 1
					puts " ERR"
				end
			end
			z + 1 == 4 ? z = 0 : z = z + 1
		end
	end
end
puts "Now reading #{ARGV[0]}"
read = Read.new(ARGV[0])
