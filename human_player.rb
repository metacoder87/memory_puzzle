            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class HumanPlayer

    attr_reader :player

    def initialize(player)
        @player = player
    end

    def get_guess
        puts "Take a guess..."
        move = gets.chomp.split(" ")
        move.map! { |ele| ele.to_i }
        puts "#{@player} chose #{move}."
        sleep(2)
        return move
    end

    def recieve_revealed_card(card, location)
        # walking like a duck
    end

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle