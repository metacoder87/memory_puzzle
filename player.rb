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
        puts "Do you want to play?"
        type = gets.chomp.to_s.downcase
        system 'clear'
        "yes, yas, yah, yepper, yup, yeah, i guess, if i have to".include?(type)
    end

    def get_player_name
        system 'clear'
        puts 'What should I call you?'
        name = gets.chomp.split(" ")
        name.map! { |ele| ele.to_s.capitalize }
        name = name.join(" ")
        system 'clear'
        return name
    end

    def get_guess
        @player.get_guess
    end

    def recieve_revealed_card(card, location)
           @player.recieve_revealed_card(card, location)
    end

end



            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle