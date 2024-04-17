# spec/poker_app_spec.rb
require 'spec_helper'
require_relative '../poker_app'

RSpec.describe PokerApp do
  subject { PokerApp.new('poker_test.txt') }

  describe '#evaluate_hand' do
    it 'correctly identifies a HIGH CARD hand' do
      cards = ['4C', 'JD', '5C', 'TH', '8S']
      expect(subject.send(:evaluate_hand, cards)).to eq(0)
    end

    it 'correctly identifies a ONE PAIR hand' do
      cards = ['5H', '5C', 'AS', 'QH', '8S']
      expect(subject.send(:evaluate_hand, cards)).to eq(1)
    end

    it 'correctly identifies a TWO PAIR hand' do
      cards = ['5H', '5C', 'AS', 'AH', '9S']
      expect(subject.send(:evaluate_hand, cards)).to eq(2)
    end

    it 'correctly identifies a THREE OF A KIND hand' do
      cards = ['5H', '9C', 'AS', '9H', '9S']
      expect(subject.send(:evaluate_hand, cards)).to eq(3)
    end

    it 'correctly identifies a STRAIGHT hand' do
      cards = ['4H', '5C', '6S', '7H', '8S']
      expect(subject.send(:evaluate_hand, cards)).to eq(4)
    end

    it 'correctly identifies a FLUSH hand' do
      cards = ['5H', '6H', 'AH', 'QH', '9H']
      expect(subject.send(:evaluate_hand, cards)).to eq(5)
    end

    it 'correctly identifies a FULL HOUSE hand' do
      cards = ['5H', '5C', '5S', '9H', '9S']
      expect(subject.send(:evaluate_hand, cards)).to eq(6)
    end

    it 'correctly identifies a FOUR OF A KIND hand' do
      cards = ['5H', '5C', '5S', '5D', '9S']
      expect(subject.send(:evaluate_hand, cards)).to eq(7)
    end

    it 'correctly identifies a STRAIGHT FLUSH hand' do
      cards = ['5S', '6S', '7S', '8S', '9S']
      expect(subject.send(:evaluate_hand, cards)).to eq(8)
    end

    it 'correctly identifies a ROYAL FLUSH hand' do
      cards = ['TS', 'JS', 'QS', 'KS', 'AS']
      expect(subject.send(:evaluate_hand, cards)).to eq(9)
    end
  end

  describe '#determine_winner' do
    context 'when one player has a higher hand type' do 
      it 'correctly identifies the winner' do
        player1_hand_type = 0
        player1_cards = ['4C', 'JD', '8C', 'TH', '8S']
        player2_hand_type = 1
        player2_cards = ['5H', '5C', 'AS', 'QH', '9S']
        expect(subject.send(:determine_winner, player1_hand_type, player1_cards, player2_hand_type, player2_cards)).to eq(2)
      end

      it 'correctly identifies the winner' do
        player1_hand_type = 7
        player1_cards = ['4C', '4D', '4C', '4H', '8S']
        player2_hand_type = 4
        player2_cards = ['5H', '6C', '7S', '8H', '9S']
        expect(subject.send(:determine_winner, player1_hand_type, player1_cards, player2_hand_type, player2_cards)).to eq(1)
      end
    end

    context 'when both players have the same hand type' do 
      context 'non-high-card hands' do 
        it 'returns a tie for now...' do
          player1_hand_type = 5
          player1_cards = ['4C', 'JC', '8C', 'TC', '2C']
          player2_hand_type = 5
          player2_cards = ['4S', '5S', 'AS', 'QS', '9S']
          expect(subject.send(:determine_winner, player1_hand_type, player1_cards, player2_hand_type, player2_cards)).to eq(0)
        end

        #unimplented for now
        xit 'can handle all the different ways two same hands can still have a winner' do
          "high card wins two straigts
          highest 3 of a kind wins a full house
          etc"
        end
      end

      context 'high-card-only hands' do 
        it 'correctly identifies the winner when both players have the same hand type' do
          player1_hand_type = 0
          player1_cards = ['QS', 'JH', '8D', '2C', '5C']
          player2_hand_type = 0
          player2_cards = ['AC', '2H', '6H', '4D', 'QC']
          expect(subject.send(:determine_winner, player1_hand_type, player1_cards, player2_hand_type, player2_cards)).to eq(2)
        end
      end
    end

    it 'correctly identifies a true tie' do
      player1_hand_type = 1
      player1_cards = ['JC', 'JD', '8C', '2D', '9D']
      player2_hand_type = 1
      player2_cards = ['JH', 'JS', '8S', '2H', '9S']
      expect(subject.send(:determine_winner, player1_hand_type, player1_cards, player2_hand_type, player2_cards)).to eq(0)
    end
  end

  describe "subject" do #unimplented for now
    subject { PokerApp.new(File.open("poker_test.txt")) } 
    
    xit "has an open file ready to ride" do
      expect(subject.data_file.class).to eq(File)
    end

    xit "keeps track of user wins" do
      expect(subject.player1_wins).to eq(0)
      expect(subject.player2_wins).to eq(0)
    end
  end

  describe '#play_games_from_file' do
    xit 'processes the data file correctly' do
      expect(subject).to receive(:display_hand_results).exactly(1).times
      expect(subject).to receive(:display_total_wins).once
      subject.play_games_from_file
    end
  end
end