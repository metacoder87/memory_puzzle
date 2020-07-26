            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class HumanPlayer

    def initialize(player)
        @player = player
    end

    def get_guess
        puts "Take a guess..."
        move = gets.chomp.split(" ")
        move.map! { |ele| ele.to_i }
    end

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle