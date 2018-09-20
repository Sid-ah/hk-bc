require_relative "spec_helper"

describe ListController do
  after(:all) { File.truncate(TEST_DATA_FILENAME, 0) }

  let(:filename) { TEST_DATA_FILENAME }
  let(:parser) { ItemParser }
  let(:writer) { ItemWriter }
  let(:controller) { ListController.new(filename: filename, parser: parser, writer: writer) }

  it "has a filename where item data is persisted" do
    expect(controller.filename).to be filename
  end

  it "has a parser to read in items" do
    expect(controller.parser).to be parser
  end

  it "has a writer to persist items" do
    expect(controller.writer).to be writer
  end

  it "requires a filename" do
    expect { ListController.new(parser: parser, writer: writer) }.to raise_error(ListController::NoFilenameError)
  end

  it "requires a parser" do
    expect { ListController.new(filename: filename, writer: writer) }.to raise_error(ListController::NoParserError)
  end

  it "requires a writer" do
    expect {ListController.new(filename: filename, parser: parser) }.to raise_error(ListController::NoWriterError)
  end

  describe "running commands" do
    describe "list" do
      before do
        open(TEST_DATA_FILENAME, "w") do |file|
          file << "[X] Walk the cat.\n"
          file << "[ ] Give the cat a bath.\n"
        end
      end

      it "returns a string representing each of the items stored in the file" do
        expect(controller.run("list")).to eq "[X] Walk the cat.\n[ ] Give the cat a bath."
      end
    end

    describe "add" do
      before do
        open(TEST_DATA_FILENAME, "w") do |file|
          file << "[X] Walk the cat.\n"
        end
      end

      it "appends a new item to the file" do
        expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n"
        controller.run("add", "Something fun.")
        expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n[ ] Something fun.\n"
      end

      it "reports that an item was appended" do
        expect(controller.run("add", "Something fun.")).to eq "Appended \"Something fun.\" to the list."
      end
    end

    describe "remove" do
      before(:each) do
        open(TEST_DATA_FILENAME, "w") do |file|
          file << "[X] Walk the cat.\n"
          file << "[ ] Give the cat a bath.\n"
        end
      end

      context "when an item matches the provided text" do
        it "removes the data for the matching item from the data file" do
          expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n[ ] Give the cat a bath.\n"
          controller.run("remove", "bath")
          expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n"
        end

        it "reports that the item was removed" do
          expect(controller.run("remove", "bath")).to eq "Removed \"Give the cat a bath.\" from the list."
        end
      end

      context "when no item matches the provided text" do
        it "reports that no mathcing item was found" do
          expect(controller.run("remove", "dog")).to eq "No item matching \"dog\" could be found."
        end
      end
    end

    describe "complete" do
      before do
        open(TEST_DATA_FILENAME, 'w') do |file|
          file << "[ ] Walk the cat.\n"
        end
      end

      context "when an item matches the provided text" do
        it "marks the item complete in the data file" do
          expect(File.read(TEST_DATA_FILENAME)).to eq "[ ] Walk the cat.\n"
          controller.run("complete", "walk")
          expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n"
        end

        it "reports that the item was marked complete" do
          expect(controller.run("complete", "walk")).to eq "Marked \"Walk the cat.\" as complete."
        end
      end

      context "when no item matches the provided text" do
        it "reports that no mathcing item was found" do
          expect(controller.run("complete", "dog")).to eq "No item matching \"dog\" could be found."
        end
      end
    end

    it "raises an error if it doesn't know how to handle a command" do
      expect { controller.run("sing and dance") }.to raise_error(ListController::UnsupportedCommand, "The command \"sing and dance\" is invalid.")
    end
  end
end
