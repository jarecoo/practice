# spec/poker_app_spec.rb
require 'spec_helper'
require_relative '../poker_app'

RSpec.describe PokerApp do
  describe '#evaluate_hand' do
    it 'correctly identifies a high card hand' do
      cards = ['4C', 'JD', '8C', '10H', '8S']
      expect(subject.evaluate_hand(cards)).to eq(0)
    end

    it 'correctly identifies a one pair hand' do
      cards = ['5H', '5C', 'AS', 'QH', '9S']
      expect(subject.evaluate_hand(cards)).to eq(1)
    end

    # Add tests for the other hand types
  end

  describe '#determine_winner' do
    it 'correctly identifies the winner when one player has a higher hand type' do
      player1_cards = ['4C', 'JD', '8C', '10H', '8S']
      player2_cards = ['5H', '5C', 'AS', 'QH', '9S']
      expect(subject.determine_winner(player1_cards, player2_cards)).to eq(2)
    end

    it 'correctly identifies the winner when both players have the same hand type' do
      player1_cards = ['QS', 'JH', 'QD', '2C', '5C']
      player2_cards = ['AC', 'QH', '6H', '4D', 'QC']
      expect(subject.determine_winner(player1_cards, player2_cards)).to eq(2)
    end

    it 'correctly identifies a tie' do
      player1_cards = ['2C', '3D', '4H', '5S', '6C']
      player2_cards = ['3C', '4D', '5H', '6S', '2C']
      expect(subject.determine_winner(player1_cards, player2_cards)).to eq(0)
    end
  end

  describe '#process_data' do
    it 'processes the data file correctly' do
      expect(subject).to receive(:display_hand_results).exactly(1000).times
      expect(subject).to receive(:display_total_wins).once
      subject.process_data('poker_data.txt')
    end
  end
end