            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


class Card

    def to_s
        self.to_s
    end

    def ==(b)
        self.eql? b
    end

    attr_reader :face_val

    def initialize(face_val)
        @face_val = face_val
        @status = ["face_up", "face_down"]
    end

    def hide
        @status.rotate! if @status[0] == "face_up"
    end

    def reveal
        @status.rotate! if @status[0] == "face_down"
    end

    def print
        if @status[0] == "face_up"
            puts @face_val 
        else puts " "
        end
    end

end

card = Card.new("P")
shard = Card.new("S")
drac = card.dup

puts "Prints card:"
card.print

puts "Prints shard:"
shard.print

puts "Hide card: "
card.hide
card.print

puts "Reveal card: "
card.reveal
card.print

puts "card == shard " # => false
puts card.face_val==(shard.face_val)

puts "drac == card " # => true
puts drac.face_val.==(card.face_val)



            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle