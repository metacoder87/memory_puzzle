            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/memory_puzzle


require_relative "card"

class Board



    attr_reader :grid, :cards, :card_ref, :guessed, :display_grid

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
        top_border(arr)
        side_border(arr)
    end

    def top_border(arr)
       arr[0] = (1..4).to_a.unshift("M")
    end

    def side_border(arr)
        (1..4).to_a.each { |num| arr[num][0] = num }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def positions(arr)
        positions = []
        arr.each_with_index do |row, idx| 
            row.each_index do |i| 
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

    def base_grid
        g = Array.new(5) { Array.new(5).fill(" ") }
        borders(g)
        g
    end

    def populate_display
        positions(@display_grid).each do |idx| 
            @display_grid[idx[0]][idx[1]] = @card_ref[idx[0]][idx[1]].reveal
        end
    end

    def render
        @grid.each { |row| puts row.join("  ") }
    end

    def render_display
        @display_grid.each { |row| puts row.join("  ") } 
    end

    def match?
        pos1 = @guessed[0]
        pos2 = @guessed[1]
        if @card_ref[pos1[0]][pos1[1]].reveal == @card_ref[pos2[0]][pos2[1]].reveal
            puts "It's a match"
            @guessed.each { |position| @matched << position }
            @grid[pos1[0]][pos1[1]] = @card_ref[pos1[0]][pos1[1]].reveal
            @grid[pos2[0]][pos2[1]] = @card_ref[pos2[0]][pos2[1]].reveal
            @temp_grid[pos1[0]][pos1[1]] = @card_ref[pos1[0]][pos1[1]].reveal
            @temp_grid[pos2[0]][pos2[1]] = @card_ref[pos2[0]][pos2[1]].reveal
        else puts "Not a match"
        end
        render
    end

    def won?
        if @grid == @display_grid
            return "WON, You must have a mind like a steel trap. \n Game Over"
        end
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
       @temp_grid.each { |row| puts row.join("  ") } 
        if @guessed.count == 2
            match?
        end
        if positions(base_grid).count == @matched.count
            won?
        end
    end
