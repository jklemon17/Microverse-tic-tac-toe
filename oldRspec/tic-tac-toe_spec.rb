# require 'tictactoe'
require 'game'

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
  # describe "#marker=" do
  #   context "trying to change marker" do
  #     it "raises a NoMethodError" do
  #       # Both tests below will pass, the second is just more specific
  #       #expect { @player.marker="O" }.to raise_error
  #       expect { @player.marker="O" }.to raise_error(NoMethodError)
  #     end
  #   end
  # end
end

describe Square do
  # build one instance of a Square first
  before do
    @square = Square.new('a1')
  end

  describe ".new" do
    context "given a instance of square" do
      it "should have a name and a initial state" do
        # Testing that player name and marker initialize correctly.
        expect([@square.name, @square.state]).to eql(["a1", "_"])
      end
    end
  end

  describe "#name=" do
    context "trying to change name" do
      it "raises a NoMethodError" do
        # Testing that the name of a square cannot be changed
        expect { @square.name="c3" }.to raise_error(NoMethodError)
      end
    end
  end

end

describe Game do

  # build one instance of a Square first
  before do
    @player1 = Player.new("Kyle", "X")
    @player2 = Player.new("Paul", "O")
    @current_game = Game.new(@player1, @player2)
    @current_game.change_turn
  end


  describe "#change_turn" do
    context "when a player has finished their move" do
      it "the turn variable should change" do
        # Testing that player name and marker initialize correctly.
        expect(@current_game.turn_marker).to eql("O")
      end


      it "the turn variable should change" do
        # Testing that player name and marker initialize correctly.
        # NOTE CANT DO A "before do"  within an a test/example
        # before do
          @current_game.change_turn
        # end
        expect(@current_game.turn_marker).to eql("X")
      end

    end
  end


  # Tests to perform:
  # check if winner
  # check for correct winner
  # check if draw (board full and no winner)
  # check for invalid target square (c5, d2...)
  # check for square not empty
  # check for square gets updated
  # check for rename players


  # describe "#name=" do
  #   context "trying to change name" do
  #     it "raises a NoMethodError" do
  #       # Testing that the name of a square cannot be changed
  #       expect { @square.name="c3" }.to raise_error(NoMethodError)
  #     end
  #   end
  # end

end
