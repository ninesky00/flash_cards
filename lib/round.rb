class Round
    attr_reader :deck, :turns, :correct_by_category, :turns_by_category
    def initialize(deck)
        @deck = deck
        @turns = []
        @correct_by_category = []
        @turns_by_category = []
    end
    
    def current_card
        current_card = @deck.cards[@turns.count]
    end

    def take_turn(guess)
       if guess == current_card.answer
        @correct_by_category << current_card.category  
       end
        @turns_by_category << current_card.category
        @turns << Turn.new(guess, current_card)
        @turns.last
    end

    def number_correct
        @correct_by_category.count
    end

    def number_correct_by_category(category)
        @correct_by_category.count(category)
    end

    def percent_correct
        (@correct_by_category.count.to_f * 100 / @turns.count.to_f).round(2)
    end
    
    def percent_correct_by_category(category)
        (@correct_by_category.count(category).to_f * 100 / @turns_by_category.count(category)).to_f.round(2)
    end
end
