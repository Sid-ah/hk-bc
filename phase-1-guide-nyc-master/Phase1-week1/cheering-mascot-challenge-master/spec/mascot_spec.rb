require_relative "spec_helper"

describe "mascot helpers" do
  describe "call_out_cheer" do

    before(:each) do
      # Make up a string to use in the tests
      @random_string = ("A".."F").to_a.sample(2).join

      # I want to fake user input during tests,
      # so when gets is called, just send back
      # @random_string plus a newline character.
      allow_any_instance_of(Object).to receive(:gets).and_return(@random_string + "\n")
    end

    it "calls for user input" do
      # I expect the program to call gets on the main object
      # as a result of calling call_out_cheer.
      expect_any_instance_of(Object).to receive(:gets)

      # Now call call_out_cheer to trigger the gets call
      call_out_cheer
    end

    it "returns user input without newline characters at the end" do
      expect(call_out_cheer).to eq @random_string
    end
  end

  describe "display" do
    it "outputs its argument to the console" do
      expect { display "Go Team!" }.to output(/Go Team!/).to_stdout
    end
  end

  describe "mascot_sign_for" do
    context "when the mascot doesn't know the cheer" do
      it "responds with a generic sign" do
        expect(mascot_sign_for "UNKNOWN CHEER").to eq "Go Team!"
      end
    end

    context "when the mascot knows the cheer" do
      context "when cheer call is shouted" do
        it "responds as if the mascot understood" do
          expect(mascot_sign_for "RED HOT").to eq "H-O-T!"
          expect(mascot_sign_for "DO IT AGAIN").to eq "Go, Fight, Win"
          expect(mascot_sign_for "2 BITS").to eq "Holler!"
          expect(mascot_sign_for "STOMP YOUR FEET").to eq "STOMP!"
        end
      end

      context "when cheer call is not shouted" do
        it "responds with a generic sign" do
          expect(mascot_sign_for("red hot")).to eq "Go Team!"
          expect(mascot_sign_for("do it again")).to eq "Go Team!"
          expect(mascot_sign_for("2 bits")).to eq "Go Team!"
          expect(mascot_sign_for("stomp your feet")).to eq "Go Team!"
        end
      end
    end
  end
end
