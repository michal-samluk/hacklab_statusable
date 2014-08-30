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
      klass.class_eval <<-eoruby, __FILE__, __LINE__ + 1
          def #{column}                                                          # def state
            status_value = #{column.to_s.pluralize}[read_attribute(:#{column})]  #   status_value = states[read_attribute(:state)]
            status_value.to_s.humanize unless status_value.nil?                  #   status_value.to_s.humanize unless status_value.nil?
          end                                                                    # end

          def #{column.to_s.pluralize}      # def states
            self.class.statusable_options   #   self.class.statusable_options
          end                               # end
      eoruby

      options.each { |index, name| define_methods(index, name) }
    end

    def define_methods(index, name)
      klass.class_eval <<-eoruby, __FILE__, __LINE__ + 1
          scope :#{name}, -> { where(:#{column} => #{index}) }        # scope :state, -> { where(:state => 0) }

          def #{name}!                                                # def active!
            update_columns(#{column}: #{index}, updated_at: Time.now) #   update_columns(state: 0, updated_at: Time.now)
          end                                                         # end

          def #{name}                                                 # def active
            self.#{column} = #{index}                                 #   self.state = 0
          end                                                         # end

          def #{name}?                                                # def active?
            read_attribute(:#{column}) == #{index}                    #   read_attribute(:state) == 0
          end                                                         # end
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