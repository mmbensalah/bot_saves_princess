require 'pry'

class SavePrincess
  attr_reader :completed_matrix

  def initialize(input_size)
    @input_size = input_size
  end

  def build_matrix
    matrix = []

    @input_size.times do
      matrix << get_input_matrix
    end

    @completed_matrix =
      matrix.map do |row|
        row.chars
      end
  end

  def find_center_position
    [@input_size/2, @input_size/2]
  end

  def find_princess_position
    princess_coordinates = []

    @completed_matrix.each_with_index do |row, x|
      row.each_with_index do |position, y|
        princess_coordinates << [y, x] if position == "p"
      end
    end
    princess_coordinates.flatten
  end

  def delta_coordinates
    delta_position = []
    delta_position << find_princess_position[0] - find_center_position[0]
    delta_position << find_center_position[1] - find_princess_position[1]
    delta_position
  end

  def display_path_to_princess
    translate_x_coordinates
    translate_y_coordinates
  end

  def translate_x_coordinates
    if delta_coordinates[0] < 0
      (delta_coordinates[0] * -1).times do
        puts "LEFT"
      end
    else
      delta_coordinates[0].times do
        puts "RIGHT"
      end
    end
  end

  def translate_y_coordinates
    if delta_coordinates[1] < 0
      (delta_coordinates[1] * -1).times do
        puts "DOWN"
      end
    else
      delta_coordinates[1].times do
        puts "UP"
      end
    end
  end

  def get_input_matrix
    gets.chomp
  end
end
