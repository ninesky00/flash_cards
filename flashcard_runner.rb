require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


   
    def start 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        puts "Welcome! You're playing with #{cards.count} cards."
        puts "--------------------------------------------------"
        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess = gets.chomp.to_s
        new_turn = round.take_turn(guess)
        puts new_turn.feedback

        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess2 = gets.chomp.to_s
        new_turn = round.take_turn(guess2)
        puts new_turn.feedback

        puts "This is card number #{round.turns.count + 1} out of #{cards.count}."
        puts round.current_card.question
        guess3 = gets.chomp.to_s
        new_turn = round.take_turn(guess3)
        puts new_turn.feedback

        puts "----------------- Game Over! ------------------"
        puts "You had #{round.number_correct} out of #{cards.count} for a total of #{round.percent_correct}%."
        puts "#{cards[0].category} - #{round.percent_correct_by_category(cards[0].category)} % correct"
        puts "#{cards[1].category} - #{round.percent_correct_by_category(cards[1].category)} % correct"
        puts "#{cards[2].category} - #{round.percent_correct_by_category(cards[2].category)} % correct"
    end

    start