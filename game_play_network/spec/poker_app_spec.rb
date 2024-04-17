# spec/poker_app_spec.rb
require 'spec_helper'
require_relative '../poker_app'

RSpec.describe PokerApp do
  subject { PokerApp.new('poker_test.txt') }
  describe '#evaluate_hand' do
    it 'correctly identifies a HIGH CARD hand' do
      cards = ['4C', 'JD', '5C', 'TH', '8S']
      expect(subject.evaluate_hand(cards)).to eq(0)
    end

    it 'correctly identifies a ONE PAIR hand' do
      cards = ['5H', '5C', 'AS', 'QH', '8S']
      expect(subject.evaluate_hand(cards)).to eq(1)
    end

    it 'correctly identifies a TWO PAIR hand' do
      cards = ['5H', '5C', 'AS', 'AH', '9S']
      expect(subject.evaluate_hand(cards)).to eq(2)
    end

    it 'correctly identifies a THREE OF A KIND hand' do
      cards = ['5H', '9C', 'AS', '9H', '9S']
      expect(subject.evaluate_hand(cards)).to eq(3)
    end

    it 'correctly identifies a STRAIGHT hand' do
      cards = ['4H', '5C', '6S', '7H', '8S']
      expect(subject.evaluate_hand(cards)).to eq(4)
    end

    it 'correctly identifies a FLUSH hand' do
      cards = ['5H', '6H', 'AH', 'QH', '9H']
      expect(subject.evaluate_hand(cards)).to eq(5)
    end

    it 'correctly identifies a FULL HOUSE hand' do
      cards = ['5H', '5C', '5S', '9H', '9S']
      expect(subject.evaluate_hand(cards)).to eq(6)
    end

    it 'correctly identifies a FOUR OF A KIND hand' do
      cards = ['5H', '5C', '5S', '5D', '9S']
      expect(subject.evaluate_hand(cards)).to eq(7)
    end

    it 'correctly identifies a STRAIGHT FLUSH hand' do
      cards = ['5S', '6S', '7S', '8S', '9S']
      expect(subject.evaluate_hand(cards)).to eq(8)
    end

    it 'correctly identifies a ROYAL FLUSH hand' do
      cards = ['TS', 'JS', 'QS', 'KS', 'AS']
      expect(subject.evaluate_hand(cards)).to eq(9)
    end
  end

  # describe '#determine_winner' do
  #   it 'correctly identifies the winner when one player has a higher hand type' do
  #     player1_cards = ['4C', 'JD', '8C', '10H', '8S']
  #     player2_cards = ['5H', '5C', 'AS', 'QH', '9S']
  #     expect(subject.determine_winner(player1_cards, player2_cards)).to eq(2)
  #   end

  #   it 'correctly identifies the winner when both players have the same hand type' do
  #     player1_cards = ['QS', 'JH', 'QD', '2C', '5C']
  #     player2_cards = ['AC', 'QH', '6H', '4D', 'QC']
  #     expect(subject.determine_winner(player1_cards, player2_cards)).to eq(2)
  #   end

  #   it 'correctly identifies a tie' do
  #     player1_cards = ['2C', '3D', '4H', '5S', '6C']
  #     player2_cards = ['3C', '4D', '5H', '6S', '2C']
  #     expect(subject.determine_winner(player1_cards, player2_cards)).to eq(0)
  #   end
  # end

  # describe '#process_data' do
  #   it 'processes the data file correctly' do
  #     expect(subject).to receive(:display_hand_results).exactly(1).times
  #     expect(subject).to receive(:display_total_wins).once
  #     subject.play_games_from_file
  #   end
  # end
end