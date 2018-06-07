# require 'tictactoe'
require 'square'

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
