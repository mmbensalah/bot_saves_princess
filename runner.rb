require_relative 'lib/save_princess'

Input.first_instructions

matrix = Matrix.new(Input.get_matrix_size)

Input.second_instructions

game = SavePrincess.new(matrix)

matrix.build_matrix
matrix.find_bot_position
matrix.find_princess_position

game.display_path_to_princess
