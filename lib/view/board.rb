class Board
    include Enumerable
    attr_accessor :board
    def initialize
            @board = [*0..8].map {|i| BoardCase.new(i).content} #on init board avec 9 instances boardcases
    end

    def display #on présente le plateau en glissant entre des puts les boardcases
        puts "-"*9
        puts "#{@board[0..2].join(" | ")}"
        puts "--|---|--"
        puts "#{@board[3..5].join(" | ")}"
        puts "--|---|--"
        puts "#{@board[6..8].join(" | ")}"
        puts "-"*9
    end

    def playing(symbol)

        puts "\nOù veux tu jouer ?\n"
        puts "\nFais attention à ne pas jouer une case déjà prise, tu perdras ton tour.\n"
        puts ""
        puts "0 1 2"
        puts "3 4 5"
        puts "6 7 8"
        puts ""
        position = gets.chomp().to_i
        @board = @board.each_index.map {|e| e == position && @board[e] != "X" && @board[e] != "O" ? @board[e] = symbol : @board[e]} #si la position rentrée correspond à qqch de board et que cette case n'est pas occupée par un symbole on met le symbole du current player ou alors il passe son tour
        
    end

    def victory? #conditons de victoires traduisant des alignements
        if (@board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " ") || (@board[3] == @board[4] && @board[3] == @board[5] && @board[3] != " ") || (@board[6] == @board[7] && @board[6] == @board[8] && @board[6] != " ") || (@board[0] == @board[3] && @board[0] == @board[6] && @board[0] != " ") || (@board[1] == @board[4] && @board[1] == @board[7] && @board[1] != " ") || (@board[2] == @board[5] && @board[2] == @board[8] && @board[2] != " ") || (@board[0] == @board[4] && @board[0] == @board[8] && @board[0] != " ") || (@board[2] == @board[4] && @board[2] == @board[6] && @board[2] != " ")
            return true
        else
            return false
        end
    end


end