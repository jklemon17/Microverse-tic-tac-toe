require 'tic-tac-toe'

describe Player do
  before do
    @player = Player.new("Paul", "X")
  end


  describe ".new" do
    context "given a player name and marker" do
      it "creates a player object with name and symbol" do
        # Testing that player name and marker initialize correctly.
        expect([@player.name, @player.marker]).to eql(["Paul", "X"])
      end
    end
  end
  describe "#marker=" do
    context "trying to change marker" do
      it "raises a NoMethodError" do
        # Both tests below will pass, the second is just more specific
        #expect { @player.marker="O" }.to raise_error
        expect { @player.marker="O" }.to raise_error(NoMethodError)
      end
    end
  end

end
