class Input
  attr_reader :matrix_size

  def self.first_instructions
    puts "Enter an odd number to create matrix i.e. 3"
  end

  def self.get_matrix_size
    $stdin.gets.chomp.to_i
  end

  def self.second_instructions
    puts "Enter the board layout placing 'm' in the center i.e. per the HackerRank instructions"
  end
end
