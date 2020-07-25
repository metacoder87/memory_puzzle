            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class Card
    
    def ==(b)
        self.eql? b
    end

    attr_accessor :face_val

    def initialize(face_val)
        @face_val = face_val
        @face_down = " "
    end

    def hide
        return @face_down
    end

    def reveal
        return @face_val
    end

end

# card = Card.new("P")
# shard = Card.new("S")
# drac = card.dup

# puts "Prints card:"
# puts card.reveal

# puts "Prints shard:"
# puts shard.reveal

# puts "Hide card: "
# puts card.hide

# puts "Reveal card: "
# puts card.reveal

# puts "card == shard " # => false
# puts card.face_val==(shard.face_val)

# puts "drac == card " # => true
# puts drac.face_val.==(card.face_val)

# puts card
# puts shard



            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle