class Player
    attr_accessor :name, :symbol
    #On init chaque joueur avec un nom et un symbole
    def initialize(player_name, symbol="")
        @name = player_name
        @symbol = symbol
    end
end
