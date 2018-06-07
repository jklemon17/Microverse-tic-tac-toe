# require 'tictactoe'
require 'game'

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

      # TO TEST IF A PUTS STATEMENT MATCHES EXPECTATION:
      # MUST FOLLOW THIS FORMAT >>>EXACTLY<<<
      # CANNOT BE IN A "it" black like other examples above
      # CANNOT USE SINGLE QUOTES, PROBLEMS WITH '\n'
      specify { expect { @current_game.ask_player }.to output("Paul, choose a square: (a1 to c3)\n").to_stdout }
      # LINK:  https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher
      # Search for "specify { expect { print('foo') }.to output('foo').to_stdout }"

    end
  end

  describe "#outcome" do

    context "when there is a win condition" do
      it "outcome method returns 'win' " do
        @current_game.squares['a1'].state = "X"
        @current_game.squares['a2'].state = "X"
        @current_game.squares['a3'].state = "X"
        expect(@current_game.outcome).to eql('win')
      end
    end

    context "when there is NOT a win condition" do
      it "outcome method should NOT return 'win' " do
        @current_game.squares['a1'].state = "X"
        @current_game.squares['a2'].state = "X"
        @current_game.squares['a3'].state = "O"
        expect(@current_game.outcome).to_not eql('win')
      end
    end

    context "when there is draw condition" do
      it "outcome method should return 'draw' " do
        @current_game.squares['a1'].state = "X"
        @current_game.squares['a2'].state = "O"
        @current_game.squares['a3'].state = "X"
        @current_game.squares['b1'].state = "X"
        @current_game.squares['b2'].state = "O"
        @current_game.squares['b3'].state = "X"
        @current_game.squares['c1'].state = "O"
        @current_game.squares['c2'].state = "X"
        @current_game.squares['c3'].state = "O"
        expect(@current_game.outcome).to eql('draw')
      end
    end

  end

  describe "#check_if_valid" do
    context "when valid target is chosen" do
      it "returns true" do
        expect(@current_game.check_if_valid('b2')).to eql(true)
      end
    end
    context "when INvalid target is chosen" do
      it "returns false" do
        expect(@current_game.check_if_valid('K7')).to eql(false)
      end
    end
    context "when target chosen is not empty" do
      it "returns false" do
        @current_game.squares['b2'].state = "O"
        expect(@current_game.check_if_valid('b2')).to eql(false)
      end
    end
  end

  describe "#update_square" do
    context "when passed a target" do
      it "updates the target marker, so it's no longer '_'" do
        @current_game.update_square("b2")
        expect(@current_game.squares["b2"].state).to_not eql("_")
      end
    end
  end

end
