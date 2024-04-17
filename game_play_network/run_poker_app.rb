## run poker app
irb -r ./poker_app.rb

app = PokerApp.new(File.open("poker.txt"))
app.play_games_from_file
