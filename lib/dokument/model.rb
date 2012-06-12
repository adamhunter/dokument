module Dokument
  module Model

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def dokuments
        @dokuments ||= Hash.new
      end

      def dokument(name, options={})
        dokuments[name] = Association.new(name, self, options)
        add_association_reader(name)
      end

      private

      def add_association_reader(name)
        define_method(name) do
          get_attachment(name) || set_attachment(name)
        end
      end
    end

    private

    def get_attachment(name)
      instance_variable_get(:"@_#{name}")
    end
    
    def set_attachment(name)
      instance_variable_set(:"@_#{name}", Dokument::Attachment.new(self, self.class.dokuments[name]))
    end

  end
end
