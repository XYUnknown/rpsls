# Symbols for the Rock, Paper, Scissors, Lizard, Spock game
# author - Xueying Qin

class Symbols
    def initialize(name, defeat1, defeat2)
		@name = name
		@defeat1 = defeat1 
		@defeat2 = defeat2
    end
    
    def get_name
        return @name
    end

    def is_defeat(symbol_name)
        if symbol_name == @name # draw
            return 0
        elsif symbol_name == @defeat1 || symbol_name == @defeat2 # win
            return 1
        else # lose
            return -1
        end
    end
end