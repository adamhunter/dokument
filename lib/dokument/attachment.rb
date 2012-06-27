require 'forwardable'

module Dokument
  class Attachment
    extend Forwardable

    delegate %w[raw_data raw_data= content_type content_type=] => :robject

    attr_reader :model, :association

    def initialize(model, association)
      @model       = model
      @association = association
    end

    def robject
      @robject ||= bucket.get_or_new(model.send(association.key).to_s)
    end

    def data
      raw_data
    end

    def data=(value)
      self.raw_data = value
    end

    def save(options={})
      raise IncompleteError.new("Attachment is missing content_type or data (#{inspect})") unless complete?
      robject.store(options)
    end

    def incomplete?
      content_type.nil? || data.nil?
    end

    def complete?
      !incomplete?
    end

    private 

    def bucket
      Dokument.client[association.bucket]
    end
    
    class IncompleteError < StandardError ; end

  end
end
