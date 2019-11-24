require_relative 'save_princess'

puts "Input an odd number for the matrix size i.e. 3"
input_size = gets.chomp.to_i
puts "Input board layout i.e. as outlined in HackerRank instructions"
start_game = SavePrincess.new(input_size)
binding.pry
start_game.build_matrix
start_game.display_path_to_princess
