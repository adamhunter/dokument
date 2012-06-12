module Dokument
  class Association

    attr_accessor :name, :key, :bucket

    def initialize(name, options = {})
      self.name   = name
      self.bucket = options[:bucket] || name.to_s
      self.key    = options[:key]    || :id
    end

  end
end
