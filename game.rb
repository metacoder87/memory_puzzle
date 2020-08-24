            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "board"
require_relative "player"

class Game

attr_reader :board

    def initialize
        @player = Player.new
        @board = Board.new
        system 'clear'
        @board.build
    end

    def run
        until @board.won? == true
            system 'clear'
            @board.render(@board.display_grid)
            @board.render(@board.temp_grid)
            guess = @player.get_guess
            puts guess
            @board.add_guess(guess)
            puts "#{guess} from game"
            @player.recieve_revealed_card(@board.comp_card_feeder(guess), guess)
            @board.reveal
        end
    end

end

game = Game.new
game.run

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle