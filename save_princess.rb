require 'pry'

class SavePrincess
  def initialize(input_size)
    @input_size = input_size
  end

  def build_matrix
    matrix_setup = []

    @input_size.times do
      matrix_setup << gets.chomp
    end

    matrix_setup.map do |row|
      row.chars
    end
  end
end
