            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "human_player"
require_relative "computer_player"

class Player

    attr_reader :player

    def initialize
        if human_player_type? 
            @player = HumanPlayer.new(get_player_name)
        else @player = ComputerPlayer.new
        end
    end
