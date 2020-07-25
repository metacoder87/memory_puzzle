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
