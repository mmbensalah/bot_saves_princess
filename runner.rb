require_relative 'save_princess'

input_size = gets.chomp.to_i
start_game = SavePrincess.new(input_size)
binding.pry
start_game.build_matrix
start_game.display_path_to_princess
