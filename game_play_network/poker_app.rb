class PokerApp
  require 'pry' # uncomment for testing

  CARD_RANKS = {
    '2' => 2, 
    '3' => 3, 
    '4' => 4, 
    '5' => 5, 
    '6' => 6, 
    '7' => 7, 
    '8' => 8, 
    '9' => 9, 
    'T' => 10, 
    'J' => 11, 
    'Q' => 12, 
    'K' => 13, 
    'A' => 14
  }

  HAND_TYPES = [
    'High Card', 
    'One Pair', 
    'Two Pair', 
    'Three of a Kind', 
    'Straight', 
    'Flush', 
    'Full House', 
    'Four of a Kind', 
    'Straight Flush', 
    'Royal Flush'
  ]

  attr_reader :player1_wins, :player2_wins, :data_file

  def initialize(data_file)
    @player1_wins = 0
    # @player1_hand_types = [] TODO: implement keeping track of all hands by player over time for analytics
    @player2_wins = 0
    # @player2_hand_types = [] TODO: implement keeping track of all hands by player over time for analytics
    @data_file = data_file
  end

  def play_games_from_file
    File.readlines(@data_file).map do |line|
      player1_cards, player2_cards = parse_file_card_lines(line)

      player1_hand_type = evaluate_hand(player1_cards)
      player2_hand_type = evaluate_hand(player2_cards)
      
      winner = determine_winner(player1_hand_type, player1_cards, player2_hand_type, player2_cards)

      update_win_tally(winner)
      display_hand_results(player1_cards, player1_hand_type, player2_cards, player2_hand_type, winner)
    end
    display_total_wins()
  end

private

  def parse_file_card_lines(line)
    cards = line.split
    [cards[0..4], cards[5..9]]
  end

  def evaluate_hand(cards)
    card_values = cards.map { |card| CARD_RANKS[card[0]] }
    card_suits = cards.map { |card| card[-1] }

    if is_straight?(card_values) && is_flush?(card_suits)
      if card_values.max == 14
        return 9 # Royal flush
      else
        return 8 # Straight flush
      end
    end

    # Four of a Kind
    if is_four_of_a_kind?(card_values)
      return 7 
    end

    # Full House
    if is_full_house?(card_values)
      return 6
    end

    # Flush
    if is_flush?(card_suits)
      return 5 
    end

    # Straight
    if is_straight?(card_values)
      return 4
    end

    # Three of a kind
    if is_three_of_a_kind?(card_values)
      return 3 
    end

    # Two pair
    if has_two_pair?(card_values)
      return 2 
    end

    # One pair
    if is_pair?(card_values)
      return 1 
    end

    return 0 # High card
  end

  def determine_winner(player1_hand_type, player1_cards, player2_hand_type, player2_cards)
    player1_card_values = player1_cards.map { |card| CARD_RANKS[card[0]] }.sort.reverse
    player2_card_values = player2_cards.map { |card| CARD_RANKS[card[0]] }.sort.reverse

    if player1_hand_type > player2_hand_type
      return 1 # Player 1 wins
    elsif player1_hand_type < player2_hand_type
      return 2 # Player 2 wins
    elsif (player1_hand_type == player2_hand_type) && player1_hand_type != 0 # non-high-card, but same, hands
=begin
      TODO: go through each hand and determine winning set for tied hands
      write all commented logic for this in here
=end
      return 0 # Tie for now
    else
      # Hand types are both high card, compare card values
      for i in 0...player1_card_values.length
        if player1_card_values[i] > player2_card_values[i]
          return 1 # Player 1 wins
        elsif player1_card_values[i] < player2_card_values[i]
          return 2 # Player 2 wins
        elsif player1_card_values[i] == player2_card_values[i]
          next # High cards match, move to next highest cards
        end
      end

      return 0 # Tie
    end
  end

  def display_hand_results(player1_cards, player1_hand_type, player2_cards, player2_hand_type, winner)
    puts "Player 1 hand: #{player1_cards.join(' ')} (#{HAND_TYPES[player1_hand_type]})"
    puts "Player 2 hand: #{player2_cards.join(' ')} (#{HAND_TYPES[player2_hand_type]})"
    case winner
    when 1
      puts "Player 1 wins"
    when 2
      puts "Player 2 wins"
    when 0
      puts "It's a tie"
    end
    puts
  end

  def display_total_wins()
    puts "Total wins:"
    puts "Player 1: #{@player1_wins}"
    puts "Player 2: #{@player2_wins}"
  end

  def update_win_tally(winner)
    case winner
    when 1
      @player1_wins += 1
    when 2
      @player2_wins += 1
    end
  end

  def has_two_pair?(card_values)
    card_values.uniq.length == 3  && card_values.tally.values.size == 3 && card_values.tally.values.include?(2)
  end

  def is_flush?(card_suits)
    card_suits.uniq.length == 1
  end

  def is_four_of_a_kind?(card_values)
    card_values.tally.values.include?(4)
  end

  def is_full_house?(card_values)
    card_values.uniq.length == 2 && card_values.tally.values.include?(3) && card_values.tally.values.include?(2)
  end

  def is_straight?(card_values)
    sorted_values = card_values.sort
    (sorted_values.first..sorted_values.last).to_a == sorted_values
  end

  def is_three_of_a_kind?(card_values)
    card_values.uniq.length == 3 && card_values.tally.values.include?(3)
  end

  def is_pair?(card_values)
    card_values.uniq.length == 4 && card_values.tally.values.include?(2)
  end
end
