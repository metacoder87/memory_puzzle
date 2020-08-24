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
        else @player = ComputerPlayer.new('computer')
        end
    end


    def human_player_type?
        system 'clear'
        puts "Are you playing?"
        puts "You can say: Yes (if you want to play) No (to watch me play)"
        type = gets.chomp.to_s.downcase
        system 'clear'
        if type == "yes"
            true
        else false
        end
    end

    def get_player_name
        system 'clear'
        puts 'What should I call you?'
        name = gets.chomp.split(" ")
        name.map! { |ele| ele.to_s.capitalize }
        name = name.join(" ")
        system 'clear'
        puts "Nice to meet you, #{name}."
        sleep(2)
        return name
    end

    def get_guess
        @player.get_guess
    end

    def @player.receive_revealed_card(card, location)
           @known_cards[card] << location
    end

end



            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle