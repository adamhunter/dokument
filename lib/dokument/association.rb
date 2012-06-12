module Dokument
  class Association

    attr_accessor :name, :owner, :key, :bucket

    def initialize(name, owner, options = {})
      self.name   = name
      self.owner  = owner
      self.bucket = options[:bucket] || "#{owner.name}_#{name}"
      self.key    = options[:key]    || :id
    end

  end
end
