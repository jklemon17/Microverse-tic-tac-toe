# require 'tictactoe'
require 'player'

describe Player do
  # build one instance of a player first
  before do
    @player = Player.new('Paul', 'X')
  end

  describe '.new' do
    context 'given a player name and marker' do
      it 'creates a player object with name and symbol' do
        # Testing that player name and marker initialize correctly.
        expect([@player.name, @player.marker]).to eql(%w[Paul X])
      end
    end
  end
  
end
