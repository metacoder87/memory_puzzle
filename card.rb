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

end
