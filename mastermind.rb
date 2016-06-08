class Pegs 
	attr_reader :value
	def initialize (value = "-")
	@value = value
	end
end

class Board
	attr_reader :row, :vari
    def initialize(row = [], vari = []) 
  	default = Pegs.new	
  	  48.times do
  	  row.push(default.value)
      end
    @row = row.each_slice(4).to_a
    
    defaulty = Pegs.new(value = "")
    48.times do
  	  vari.push(defaulty.value)
      end
    @vari = vari.each_slice(4).to_a
    end

end

class Codemaster
	attr_reader :key, :val, :tester, :checker, :vari, :i
	attr_accessor :turns
	def initialize (key = [], tester = Board.new, i = 0, z = 0, turns = 11)
		@key = key
		@val = val
		@tester = tester
		@z = z
		@i = i
		@vari = vari
		@turns = turns
	end
	
	def interpret(output)
	case output
	when 1
	@val = "R"
	when 2
	@val = "G"
	when 3
	@val = "B"
	when 4
	@val = "C"
	when 5
	@val = "Y"
	when 6
	@val = "M"
    else
    @val = "-"	
    end
    end
    
    def push
    4.times do
    @gen = self.interpret(rand(1..6))
    self.key.push(@gen)
    end
    end
    
    def check
    	@i = 0
    	for m in 0..3
    	if tester.row[@turns][m] == @key[m]
    		@i += 1
    	end
        end
    	
    	
    	y = 0
    	hej = Marshal.dump(self.key)
        @keyer = Marshal.load(hej)
    	heb = Marshal.dump(tester.row)
    	@checker = Marshal.load(heb)

    	for x in 0..3
    	if @keyer.include?(@checker[@turns][x])
    		@keyer[@keyer.index(@checker[@turns][x])] = 0
    		checker[x] = 1
    		y += 1
    	end
        end
        
    	@i.times do
    	tester.vari[@turns] << "o"
    	end
    	
    	@z = y-@i
    	@z.times do
    	tester.vari[@turns] << "+"
    	end
    		
    end
    
    def display
	n = 0
		while n < 12
		puts " |#{tester.row[n].join(" ")}| #{tester.vari[n].join}
		\n"
		n += 1
		end
	end
	
end

class Play
	attr_reader :input, :letsplay
	def initialize (letsplay = Codemaster.new)
		@input = input
		@letsplay = letsplay
		self.newgame
	end
	
	def newgame
	@letsplay.push
	puts "NEWGAME"
	self.eachturn
    end
    
    def eachturn
      until @letsplay.turns == -1 do	
        puts "TURN : #{@letsplay.turns + 1} \nEnter 4 colors (R)Red (G)Green (B)Blue (C)Cyan (M)Magenta (Y)Yellow ex. RRGG, CMYB, GMMY as one string"	
	    @input = gets.chomp.upcase
	    self.processor
	    @input = @input.split("")
	    @letsplay.tester.row[@letsplay.turns] = @input
	    @letsplay.check
	    @letsplay.display
	    @letsplay.turns -= 1
	      if @letsplay.turns == -1
            puts "Game OVER, codebreaker LOSES, codemaster WINS!"
            Play.new
          elsif @letsplay.i == 4
            puts "Game OVER, codebreaker WINS!, codemaster LOSES"
            Play.new
          end
      end
    end
    
    def processor
    	if @input.length != 4
    		puts "\nERROR ERROR ERROR!!!!!!WRONG NUMBER OF COLORS!!!!!!!!!! TRY AGAIN!!!!! ONLY PUT 4 \n  "
    		self.eachturn
    	elsif false == @input.split("").all? {|element| ["R","G","B","C","Y","M"].include? element }
    	    puts "\n ERROR ERROR ERROR!!!WRONG COLORS #{@input.split("").join}!!!!!!ONLY PUT R G B C M Y \n !!!!"
    	    self.eachturn
        end
    end
 end
 
Play.new
