class Input
  attr_reader :matrix_size

  def self.first_instructions
    puts "Enter an odd number to create matrix i.e. 3"
  end

  def self.get_matrix_size
    size_input = $stdin.gets.chomp.to_i
    error_message(size_input)
    size_input
  end

  def self.second_instructions
    puts "Enter the board layout placing 'm' in the center i.e. per the HackerRank instructions"
  end

  def self.error_message(input)
    if input % 2 == 0
      raise ArgumentError.new("You must enter an odd number. Please start over.")
    end
  end
end

class Matrix
  attr_reader :size, :matrix, :princess, :bot

  def initialize(size)
    @size = size
  end

  def build_matrix
    matrix = []
    @size.times do
      matrix << get_input_matrix
    end
    @matrix = matrix.map{|row| row.chars}
  end

  def find_bot_position
    x = @matrix.count/2
    y = @matrix.count/2
    @bot = Bot.new([y, x])
  end

  def find_princess_position
    @matrix.each_with_index do |row, x|
      row.each_with_index do |position, y|
        @princess = Princess.new([y, x]) if position == "p"
      end
    end
    @princess
  end

  private

  def get_input_matrix
    input = $stdin.gets.chomp
    if input.length != @size
      raise ArgumentError.new("Incorrect number of columns")
    end
    input
  end
end

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

class Princess
  attr_reader :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end
end

class Bot
  attr_reader :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end
end

matrix = Matrix.new(Input.get_matrix_size)
game = SavePrincess.new(matrix)
matrix.build_matrix
matrix.find_bot_position
matrix.find_princess_position
game.display_path_to_princess
