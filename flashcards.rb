module Flashcards
  class Application
    def initialize
      @decks = []
    end

    def << deck
      @decks << deck
    end

    def play
      display_decks
      puts "Pick a deck:"
      deck = get_deck
      deck.play
    end

    def display_decks
      @decks.each {|deck| puts deck.name} 
    end

    def get_deck
      name = gets.chomp
      @decks.detect {|deck| deck.name == name}
    end
  end

  class Card
    attr_accessor :front, :back

    def initialize front, back
      @front = front
      @back = back
    end

    def correct? guess
      guess == @back
    end

    def play
      puts "#{front} >"
      guess = gets.chomp
      if correct? guess
        puts "Correct"
      else
        puts "Incorrect. The answer was #{back}"
      end
    end  
  end

  class MultipleAnswerCard < Card
    
    def correct? guess
      guess == @back.split(",")
      answers.any? {|answer| answer == guess}
    end  
  end

  class Deck
    attr_reader :name, :cards

    def initialize name
      @name = name
      @card = []
    end

    def << card
      @cards << card
    end

    def play
      shuffle
      @cards.each(&:play)  # same as @cards each {|card| card.play}
    end

    def shuffle
      @cards.shuffle!
    end
  end
end

#card1 = Flashcards::Card.new("cat", "neku")
#card2 = Flashcards::Card.new("dog", "inu")
#card3 = Flashcards::Card.new("snake", "hebi")
card = Flashcards::MultipleAnswerCard.new("violin", "baoirin,viiorin")

deck = Flashcards::Deck.new("Japanese")
#deck << card1
#deck << card2
#deck << card3
card << card

deck2 = Flashcards::Deck.new("Russian")


app = Flashcards::Application.new
app << deck
app.play

deck.shuffle

#ruby block
deck.each do |card|
  front = card.front
  back = card[:back]
  print "#{front} >"
  guess = gets.chomp
  
  if card.correct?(guess)
    puts "Correct"
  else
    puts "Incorrect. The answer was #{back}"
  end
end

