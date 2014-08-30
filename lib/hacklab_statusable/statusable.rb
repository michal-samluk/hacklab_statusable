module HacklabStatusable

  module Statusable
    extend ActiveSupport::Concern

    def status
      status_value = self.class.statusable_options[read_attribute(self.class.statusable_column)]
      status_value.to_s.humanize unless status_value.nil?
    end

    module ClassMethods

      def statusable_options
        @statusable_options
      end

      def statusable_options=(val={})
        @statusable_options = val
      end

      def statusable_column
        @statusable_column
      end

      def statusable_column=(val)
        @statusable_column = val
      end

      def acts_as_statusable(column, options)
        self.statusable_options = options
        self.statusable_column = column
        HacklabStatusable::StatusBuilder.perform(self)
      end
    end

  end

end