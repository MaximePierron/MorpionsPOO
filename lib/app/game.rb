class Game
    attr_accessor :symbol
    #on init
    def initialize
        system "clear" #on efface tout sur le terminal
        puts "\ntic tac TOE !!\n"

        puts "\nQuel est ton prénom, joueu-r-se 1 ?\n"
        name1 = gets.chomp #on récupère le nom du joueur 1
        puts "\nQuel est ton prénom, joueu-r-se 2 ?\n"
        name2 = gets.chomp #on récupère le nom du joueur 2

        formes = ["X", "O"]
        symbol1 = formes.sample(1) #les symboles sont attribués de manière aléatoire
        if symbol1 == "O"
            puts "\n#{name1} jouera les ronds."
            puts "#{name2} jouera les croix.\n"
            symbol2 = "X"
        else
            puts "\n#{name1} jouera les croix."
            puts "#{name2} jouera les ronds.\n"
            symbol2 = "O"   
        end
        @player1 = Player.new(name1, symbol1) #on crée les instances joueurs
        @player2 = Player.new(name2, symbol2)
        @board = Board.new                   #et une intance board
    end
   
    def who_starts #le premier @current_player se décide à pierre feuille ciseaux avec le texte caché sur le terminal avec STDIN.noecho

        puts "\n#{@player1.name}, choisis entre pierre, feuille et ciseaux :\n"
        @answer1 = STDIN.noecho(&:gets).chomp
        puts "\n#{@player2.name}, choisis entre pierre, feuille et ciseaux :\n"
        @answer2 = STDIN.noecho(&:gets).chomp
        #On compare les réponses des deux joueurs
        if @answer1 == @answer2
            puts "\n On a tous les deux choisi #{@answer2}. On recommence !"
            self.who_starts
        else
            if @answer1 == "pierre" && @answer2 == "feuille"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLa feuille enveloppe la pierre. #{@player2.name} gagne.\n"
                @current_player = @player2
            elsif @answer1 == "pierre" && @answer2 == "ciseaux"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLa pierre casse les ciseaux. #{@player1.name} gagne.\n"
                @current_player = @player2
            elsif @answer1 == "feuille" && @answer2 == "pierre"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLa feuille enveloppe la pierre. #{@player1.name} gagne.\n"
                @current_player = @player2
            elsif @answer1 == "feuille" && @answer2 == "ciseaux"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLes ciseaux coupent la feuille. #{@player2.name} gagne.\n"
                @current_player = @player2
            elsif @answer1 == "ciseaux" && @answer2 == "pierre"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLa pierre casse les ciseaux. #{@player2.name} gagne.\n"
                @current_player = @player2
            elsif @answer1 == "ciseaux" && @answer2 == "feuille"
                puts "\n#{@player1.name} a choisi #{@answer1}.\n"
                puts "\n#{@player2.name} a choisi #{@answer2}.\n"
                puts "\nLes ciseaux coupent la feuille. #{@player1.name} gagne.\n"
                @current_player = @player2
            else
                puts "\nJe n'ai pas compris. Recommence !\n"
                self.who_starts
            end
        end
    end

    def play
        while @board.victory? == false #la boucle de jeu
            self.round
        end
    end

    def switch_players
        if @current_player == @player1 #le changement de joueur
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def round #le déroulement d'un tour
        self.who_starts
        count_turn=0
        loop do
            system "clear"
            puts "="*9
            puts "\nVoici le plateau\n"
            @board.display
            puts "\nAu tour de #{@current_player.name}.\n"
            @board.playing(@current_player.symbol)
            if @board.victory? == true
                system "clear"
                puts "\nIl y a un alignement !\n"
                @board.display
                puts "\n#{@current_player.name} remporte la partie en #{count_turn} tours!\n"
                puts "\nVoulez-vous rejouer ? Y/N"
                reponse = gets.chomp
                if reponse == "Y"
                    Game.new.play
                else
                    puts "\nA une prochaine fois !\n"
                end
                break
            end
            switch_players
            count_turn += 1
        end
    end
end