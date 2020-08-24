            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class ComputerPlayer

    attr_reader :player

    def initialize(player)
        @player = player
        @known_cards = Hash.new([])
        @matched_cards = []
    end

    def grid_spaces
        grid = []
        arr = [1,2,3,4]
        arr.each { |num| arr.each { |n| grid << [num, n] } }
        grid
    end

    def get_guess(*positions)
        chosen =  guess
        puts "#{@player} chose #{chosen}."
        return chosen
    end

    def guess
        grid_spaces.sample
    end

    def choice
        @matched_cards[]
    end

    def recieve_revealed_card(card, location)
        @known_cards[card] << location
    end

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle