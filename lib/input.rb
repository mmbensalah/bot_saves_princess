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
