class Board      
	def initialize 
		@board = Array.new(3){Array.new(3)}    #IV
	end


	def render                      #IM
		puts 
		@board.each do |row|
			row.each do |cell|
				cell.nil? ? print("-") : print(cell.to_s)
			end
			puts
		end
		puts
	end 

	
	def add_piece(coords, piece)       #IM
		if piece_location_valid?(coords)
			# place piece
			@board[coords[0]][coords[1]] = piece
			true
		else
			false 
		end 
	end 


	def winning_combination?(piece)      #IM
		winning_diagonal?(piece) || winning_vertial?(piece) || winning_horizontal?(piece)
	end


	def full?           #IM
		@board.all? do |row|
			row.none?(&:nil?)
		end
	end  















	private 

	def piece_location_valid?(coords)
		if within_valid_coordinates?(coords)
			coordinates_available?(coords)
		end 
	end 


	def within_valid_coordinates?(coords)
		# UNLESS piece coords are in the acceptible range
		if (0..2).include?(coords[0]) && (0..2).include?(coords[1])
			true 
		else 
			puts "Piece coordinates are out of bounds"
		end 
	end
	

	def coordinates_available?(coords)
		if @board[coords[0]][coords[1]].nil?
			true 
		else 
			puts "There is already a piece there!" 
		end
	end 

	
	def winning_diagonal?(piece)
		diagonals.any? do |diags| 
			diags.all?{|cell| cell == piece}
		end
	end 


	def winning_vertial?(piece)
  	verticals.any? do |verts|
  		verts.all?{|cell| cell == piece}
  	end
  end 


	def winning_horizontal?(piece)
		horizontals.any? do |horz|
			horz.all?{|cell| cell == piece}
		end
	end 


	def diagonals
		[[@board[0][0],@board[1][1],@board[2][2]], [@board[2][0],@board[1][1],@board[0][2]]]
	end 


	def verticals
		@board
	end 


	def horizontals	
		horizontals = []
		3.times do |i|
			horizontals << [@board[0][i], @board[1][i], @board[2][i]]
		end 
		horizontals
	end 
end