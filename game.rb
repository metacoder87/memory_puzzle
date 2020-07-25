            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "board"

class Game

attr_reader :board
    def initialize
        @board = Board.new
        system 'clear'
        @board.build
    end

    def get_guess
        puts "Take a guess..."
        move = gets.chomp.split(" ")
        move.map! { |ele| ele.to_i }
    end

    def run
        until @board.won? == true
            system 'clear'
            @board.render(@board.display_grid)
            @board.render(@board.temp_grid)
            @board.add_guess(get_guess)
        end
    end

end

game = Game.new
game.run