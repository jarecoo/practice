## run poker app
# launch irb in app root folder, including poker app file
irb -r ./poker_app.rb

# instantiate app and call play_games method
app = PokerApp.new(File.open("poker.txt"))
app.play_games_from_file
