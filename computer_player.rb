            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle

class ComputerPlayer

    attr_reader :player, :known, :matches, :grid

    def initialize(player)
        @player = player.capitalize
        @known = Hash.new { |h, k| h[k] = [] }
        @grid = grid_spaces
        @turn = [1,2]
        @matches = []
        @matched = []
    end

    def grid_spaces
        (1..4).map { |num| (1..4).map { |n| [num, n] } }.flatten(1)
    end

    def get_guess
        match_catch if @turn[0] == 1
        @matches.empty? ? chosen = guess : chosen = choice
        @turn.rotate!
        return chosen
    end

    def guess
        gus = @grid.sample
        @grid.delete(gus)
        puts "#{@player} guessed #{gus}."
        sleep(2)
        return gus
    end

    def choice
        chc = @matches.shift
        puts "#{@player} chose #{chc}"
        sleep(2)
        @matched << chc
        chc
    end

    def match_catch
        known.select { |card, pos| known[card].count == 2 ? @matches << pos[0] && @matches << pos[1] && known.delete(card) : @matches }
    end

    def recieve_revealed_card(card, location)
        @matched.include?(location) ? card : @known[card] << location
    end

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle