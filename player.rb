class Player    
	attr_accessor :name, :piece


	def initialize(name = "Mystery_Player", piece, board)
		raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
		@name = name        				#IV    
		@piece = piece 							#IV
		@board = board                #IV
	end


	def get_coordinates 								#IM
		loop do 
			coords = ask_for_coordinates
			if validate_coordinates_format(coords)
				if @board.add_piece(coords, @piece)
					break
				end
			end
		end
	end 















	private

	def ask_for_coordinates 
		puts "#{@name}(#{@piece}), enter your coordinates in the form x, y: "
		# invoke .map on array [x, y] + calls to_i on each item 
		gets.strip.split(",").map(&:to_i)				
	end 


	def validate_coordinates_format(coords)
		if coords.is_a?(Array) && coords.size == 2
			true 
		else
			puts "Your coordinates are in the improper format!"
		end
	end
end