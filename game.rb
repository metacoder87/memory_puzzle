            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "board"
require_relative "human_player"

class Game

attr_reader :board
    def initialize(player)
        @player = HumanPlayer.new(player)
        @board = Board.new
        system 'clear'
        @board.build
    end

    def run
        until @board.won? == true
            system 'clear'
            @board.render(@board.display_grid)
            @board.render(@board.temp_grid)
            @board.add_guess(@player.get_guess)
        end
    end

end

game = Game.new("player_1")
game.run