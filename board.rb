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
