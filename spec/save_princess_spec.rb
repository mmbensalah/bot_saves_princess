require_relative '../lib/save_princess'

RSpec.describe SavePrincess do
  describe '#display_path_to_princess' do
    context '3x3 matrix with princess in 0,0 position' do
      before do
        size   = 3
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["p","-","-"],["-","m","-"],["-","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("LEFT\nUP\n").to_stdout
      end
    end

    context '3x3 matrix with princess in 2,0 position' do
      before do
        size   = 3
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","p"],["-","m","-"],["-","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("RIGHT\nUP\n").to_stdout
      end
    end

    context '3x3 matrix with princess in 0,2 position' do
      before do
        size   = 3
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","-"],["-","m","-"],["p","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("LEFT\nDOWN\n").to_stdout
      end
    end

    context '3x3 matrix with princess in 2,2 position' do
      before do
        size   = 3
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","-"],["-","m","-"],["-","-","p"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("RIGHT\nDOWN\n").to_stdout
      end
    end

    context '5x5 matrix with princess in 0,0 position' do
      before do
        size   = 5
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["p","-","-","-","-"],
          ["-","-","-","-","-"],["-","m","-","-","-"],["-","-","-","-","-"],
          ["-","-","-","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("LEFT\nLEFT\nUP\nUP\n").to_stdout
      end
    end

    context '5x5 matrix with princess in 5,0 position' do
      before do
        size   = 5
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","-","-","p"],
          ["-","-","-","-","-"],["-","m","-","-","-"],["-","-","-","-","-"],
          ["-","-","-","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("RIGHT\nRIGHT\nUP\nUP\n").to_stdout
      end
    end

    context '5x5 matrix with princess in 0,5 position' do
      before do
        size   = 5
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","-","-","-"],
          ["-","-","-","-","-"],["-","m","-","-","-"],["-","-","-","-","-"],
          ["p","-","-","-","-"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("LEFT\nLEFT\nDOWN\nDOWN\n").to_stdout
      end
    end

    context '5x5 matrix with princess in 5,5 position' do
      before do
        size   = 5
        @matrix = Matrix.new(size)
        @matrix.instance_variable_set(:@matrix, [["-","-","-","-","-"],
          ["-","-","-","-","-"],["-","m","-","-","-"],["-","-","-","-","-"],
          ["-","-","-","-","p"]])
        @matrix.find_bot_position
        @matrix.find_princess_position
        @game = SavePrincess.new(@matrix)
      end
      it 'displays correct instructions' do
        expect { @game.display_path_to_princess }.to output("RIGHT\nRIGHT\nDOWN\nDOWN\n").to_stdout
      end
    end
  end
end
