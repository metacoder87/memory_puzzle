            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class ComputerPlayer

    def initialize(player)
        @player = player
        @known_cards = {}
        @matched_cards = []
    end

    def get_guess(*positions)
        chosen =  guess
        puts "#{@player} chose #{chosen}."
    end

    def guess
        grid_spaces.sample
    end

    def choice
        @matched_cards[]
    end

    def recieve_revealed_card

    end

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle