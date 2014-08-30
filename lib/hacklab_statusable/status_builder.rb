module HacklabStatusable
  class StatusBuilder

    attr_reader :klass, :options

    class << self
      def perform(klass)
        new(klass).tap { |status_builder| status_builder.perform }
      end
    end

    def initialize(klass)
      @klass = klass
    end

    def perform
      options.each { |index, name| define_methods(index, name) }
    end

    def define_methods(index, name)
      klass.class_eval <<-eoruby, __FILE__, __LINE__ + 1
          scope :#{name}, -> { where(:#{column} => #{index}) }

          def #{name}!
            update_columns(#{column}: #{index}, updated_at: Time.now)
          end

          def #{name}?
            read_attribute(:#{column}) == #{index}
          end
      eoruby
    end

    private

    def column
      klass.statusable_column
    end

    def options
      klass.statusable_options
    end

  end
end