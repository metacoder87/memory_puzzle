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
