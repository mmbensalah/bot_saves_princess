require_relative 'save_princess'

puts "Enter an odd number to create matrix i.e. 3"
input_size = gets.chomp.to_i
puts "Enter the board layout placing 'm' in the center i.e. per the HackerRank instructions"
start_game = SavePrincess.new(input_size)
start_game.build_matrix
start_game.display_path_to_princess
