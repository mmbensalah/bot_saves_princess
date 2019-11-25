require_relative 'input'
require_relative 'matrix'
require_relative 'bot'
require_relative 'princess'

class SavePrincess
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def display_path_to_princess
    translate_x_coordinates
    translate_y_coordinates
  end

  private

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

  def delta_coordinates
    delta_position = []
    delta_position << @matrix.princess.coordinates[0] - @matrix.bot.coordinates[0]
    delta_position << @matrix.bot.coordinates[1] - @matrix.princess.coordinates[1]
    delta_position
  end
end
