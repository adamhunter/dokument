require 'spec_helper'

describe Dokument::Attachment do

  before :each do
    @model        = ExampleModel.new
    @content_type = 'text/plain'
    @data         = 'This is an attachment.'
    @attachment   = @model.file
    @association  = @model.file.association
    @attachment.content_type = @content_type
    @attachment.data         = @data
  end

  it "has a content_type" do
    @attachment.content_type.should eq(@content_type)
  end

  it "has a data" do
    @attachment.data.should eq(@data)
  end

  it "delegates saving to its robject" do
    @attachment.robject.should_receive(:store)
    @attachment.save
  end

  it "delegates options passed to save to the robject when storing" do
    @attachment.robject.should_receive(:store).with(:awesome => true)
    @attachment.save(:awesome => true)
  end

  describe "completeness" do
    it "is true if the data and content_type are set" do
      @attachment.should be_complete
    end

    it "is false if the data is nil" do
      @attachment.data = nil
      @attachment.should_not be_complete
    end

    it "is false if the content_type is nil" do
      @attachment.content_type = nil
      @attachment.should_not be_complete
    end

    it "will raise an exception if you try to save and it is not complete" do
      @attachment.data = nil
      expect { @attachment.save }.to raise_error(Dokument::Attachment::IncompleteError)
    end
  end

  describe "robject" do
    it "uses the attachment's data" do
      @attachment.robject.data.should eq(@data)
    end

    it "uses the attachment's content_type" do
      @attachment.robject.content_type.should eq(@content_type)
    end

    it "uses the associated model's key method for the key" do
      @attachment.robject.key.should eq(@model.id.to_s)
    end

    it "uses the association's bucket for the bucket name" do
      @attachment.robject.bucket.name.should eq(@association.bucket)
    end
  end

end
