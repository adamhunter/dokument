require 'spec_helper'

describe Dokument::Model do
  describe "provided class methods" do
    it "adds an accessor to list all defined dokuments" do
      ExampleModel.dokuments.should be_a(Hash)
    end

    it "will add a single dokument using the `dokument` class method" do
      ExampleModel.dokument :file
      ExampleModel.dokuments[:file].should be_a(Dokument::Association)
    end

    it "accepts options with the `dokument` class method" do
      ExampleModel.dokument :file, :bucket => 'files'
      ExampleModel.dokuments[:file].bucket.should eq('files')
    end
  end

  describe "provided instance methods" do
    before :each do
      @model = ExampleModel.new
    end

    it "adds an reader for the given dokument" do
      @model.should respond_to(:file)
    end

    it "will return the Dokument::Attachment for the given reader" do
      @model.file.should be_a(Dokument::Attachment)
    end

  end
end
