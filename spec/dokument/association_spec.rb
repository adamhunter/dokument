require 'spec_helper'

describe Dokument::Association do

  before :each do 
    @association = Dokument::Association.new(:file, ExampleModel)
  end

  it "take a name upon initialization" do
    @association.name.should eq(:file)
  end

  describe "attributes" do
    %w[name bucket key].each do |attribute|
      it "has a #{attribute}" do
        @association.should respond_to(attribute)
      end
    end
  end

  describe "defaults" do
    it "defaults the model key to :id" do
      @association.key.should eq(:id)
    end

    it "defaults the bucket to the string version of the name with the model class" do
      @association.bucket.should eq('ExampleModel_file')
    end
  end

  describe "initialization options" do
    before :each do
      @association = Dokument::Association.new(:file, ExampleModel, :bucket => 'files_bucket', :key => 'some_id')
    end

    it "can set the bucket name" do
      @association.bucket.should eq('files_bucket')
    end

    it "can set the model key" do
      @association.key.should eq('some_id')
    end
  end

end

