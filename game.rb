# An implementation of Rock, Paper, Scissors, Lizard, Spock game
# author - Xueying Qin

require_relative "symbols"

class Game
    # initialise choices
    def initialize
        rock = Symbols.new("rock", "lizard", "scissors")
        paper = Symbols.new("paper", "rock", "spock")
        scissors = Symbols.new("scissors", "paper", "lizard")
        lizard = Symbols.new("lizard", "paper", "spock")
        spock = Symbols.new("spock", "scissors", "rock")
        @symbol_list = [rock, paper, scissors, lizard, spock]
    end

    # get a random choice for computer
    def get_random_choice
        choice = @symbol_list[rand(5)]
        return choice
    end

    # check is user input is valid
    def is_valid_input(input)
        if input == "rock" || input == "paper" || input == "scissors" || input == "lizard" || input == "spock"
            return true
        else 
            return false 
        end
    end

    # generate winning message
    def announce_winner(symbol1, symbol2)
        case symbol1 
        when "rock"
            if symbol2 == "lizard"
                return "Rock crushes Lizard."
            else
                return "Rock cruches Scissors."
            end
        when "paper"
            if symbol2 == "rock"
                return "Paper covers Rock."
            else 
                return "Paper disproves Spock."
            end
        when "scissors"
            if symbol2 == "paper"
                return "Scissors cuts Paper."
            else 
                return "Scissors decapitates Lizard."
            end
        when "lizard"
            if symbol2 == "paper"
                return "Lizard eats Paper."
            else 
                return "Lizard poisons Spock."
            end
        when "spock"
            if symbol2 == "scissors"
                return "Spock smashes Scissors."
            else 
                return "Spock vaporizes Rock."
            end
        end
    end

    # start playing the game
    def game_start
        computer_choice = get_random_choice
        puts("Welcome to rock, paper, scissors, lizard, spock game")
        puts("Please enter your choice")
        
        # a user has 3 chance for invalid input
        is_valid = false
        user_choice = gets.chomp
        user_choice = user_choice.downcase
        for i in 0..1
            if (!is_valid_input(user_choice))
                puts("Invalid input, please enter one of: rock, paper, scissors, lizard, spock")
                user_choice = gets.chomp
                user_choice = user_choice.downcase
            else
                is_valid = true
                break
            end
        end

        if !is_valid
            puts("You entered invalid choice for three times, game over")
        else
            match_status = computer_choice.is_defeat(user_choice)
            case match_status
            when 0
                puts("DRAW")
                puts("your choice: " + user_choice )
                puts("computer choice: " + computer_choice.get_name)
            when -1 # computer lose
                puts("You WIN!" )
                puts("your choice: " + user_choice )
                puts("computer choice: " + computer_choice.get_name)
                puts(announce_winner(user_choice, computer_choice.get_name))
            when 1 # computer win
                puts ("You LOSE :(")
                puts("your choice: " + user_choice )
                puts("computer choice: " + computer_choice.get_name)
                puts(announce_winner(computer_choice.get_name, user_choice))
            end
        end
    end
end

def run
    game = Game.new
    game.game_start
end

# run the game
run