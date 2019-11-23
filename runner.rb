require_relative 'save_princess'

input_size = gets.chomp.to_i
start_game = SavePrincess.new(input_size)
start_game.build_matrix
