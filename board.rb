            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "card"

class Board



    attr_reader :temp_grid, :display_grid
    
    def initialize
        @display_grid = base_grid.dup
        @temp_grid = base_grid.dup
        @card_ref = base_grid.dup
        @grid = base_grid.dup
        @cards = cards 
        @guessed = []
        @matched = []
    end

    def borders(arr)
        top_border(arr) && side_border(arr)
        arr
    end

    def top_border(arr)
       arr[0] = (1..4).to_a.unshift("?")
    end

    def side_border(arr)
        (1..4).to_a.each { |num| arr[num][0] = num }
    end

    def [](pos)
        row, col = pos
        self[row][col]
    end

    def []=(pos, val)
        row, col = pos
        self[row][col] = val
    end

    def positions(arr)
        positions = []
        arr.each_with_index do |row, idx| 
            row.select.with_index do |card, i| 
                if arr[idx][i] == " "
                    positions << [idx, i] 
                end
            end
        end
        positions
    end

    def place_card(pos, card)
        @card_ref[pos[0]][pos[1]] = card
    end

    def populate
        i = 0
        positions(base_grid).shuffle.each { |pos| place_card(pos, @cards[i % @cards.count]) && i += 1 }
    end

    def penta_grid
        Array.new(5) { Array.new(5).fill(" ") }
    end

    def base_grid
        borders(penta_grid)
    end

    def populate_display
        positions(@display_grid).map! { |idx| @display_grid[idx[0]][idx[1]] = @card_ref[idx[0]][idx[1]].reveal }
    end

    def render(a_grid)
        a_grid.each { |row| puts row.join("  ") } 
    end

    def card_1
        @card_ref[@guessed[0][0]][@guessed[0][1]].reveal
    end

    def card_2
        @card_ref[@guessed[1][0]][@guessed[1][1]].reveal
    end

    def not_a_match
        system 'clear'
        puts "#{card_1} does not match #{card_2}"
        sleep(3)
        system 'clear'
        puts "Next player"
        sleep(3)
    end
    def match?
        if card_1 == card_2
            system 'clear'
            puts "It's a match"
            sleep(3)
            save_match && place(@grid) && place(@temp_grid)
        else not_a_match
        end
    end

    def won? 
        while @grid == @display_grid
            system 'clear'
            puts "WON, You must have a mind like a steel trap. Game Over." 
            sleep(5)
            system 'clear'
            return true
        end
        false
    end

    def add_guess(pos)
        if @guessed.count <= 1
            @guessed << pos
        else @guessed.clear
            @guessed << pos
        end
        reveal
    end

    def reveal
        positions(base_grid).each do |idx| 
                if @guessed.include?([idx[0],idx[1]]) || @matched.include?([idx[0],idx[1]])
                        @temp_grid[idx[0]][idx[1]] = @card_ref[idx[0]][idx[1]].reveal
                else @temp_grid[idx[0]][idx[1]] = @card_ref[idx[0]][idx[1]].hide
            end
        end
        render(@temp_grid)
        match? if @guessed.count == 2
        won? if positions(base_grid).count == @matched.count
    end

    def build
        populate
        populate_display
        render(@display_grid)
        sleep(6)
        system 'clear'
    end

    private

    def alphabet
        ("A".."Z").to_a
    end

    def selector
        alphabet.shuffle.first(8)
    end

    def cards 
        selector.map! { |char| Card.new(char) }
    end

end

# board = Board.new
# board.build
# board.add_guess([1,1])
# board.add_guess([2,2])
# board.add_guess([3,3])
# board.render(board.grid)
# board.render(board.display_grid)


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle