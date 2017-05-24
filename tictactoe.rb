require_relative 'player.rb'
require_relative 'board.rb'





class TicTacToe 
	def initialize 
		@board = Board.new		#IV 
		@player_x = Player.new("Madame X", :x, @board)	#IV 
		@player_y = Player.new("Mister Y", :y, @board)	#IV
		@current_player = @player_x	#IV
	end




	def play 			       #IM
		loop do 
			@board.render       
		  @current_player.get_coordinates      
			break if check_game_over        
			switch_players    
		end 
	end












	private

	def check_game_over
		check_victory || check_draw
	end 


	def check_victory
		if @board.winning_combination?(@current_player.piece)
			puts "Congratulations #{@current_player.name}, you win!"
			true 
		else 
			false 
		end
	end


	def check_draw
		if @board.full?
			puts "Bummer, you've drawn.."
			true 
		else 
			false 
		end 
	end 


	def switch_players
		if @current_player == @player_x
			@current_player = @player_y
		else 
			@current_player = @player_x
		end 
	end
end



t = TicTacToe.new
t.play 