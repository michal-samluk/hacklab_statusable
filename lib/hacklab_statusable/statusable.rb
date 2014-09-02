module HacklabStatusable

  module Statusable
    extend ActiveSupport::Concern

    module ClassMethods

      def statusable_options
        @statusable_options
      end

      def statusable_options=(val={})
        @statusable_options = val
      end

      def acts_as_statusable(options)
        self.statusable_options = options
        HacklabStatusable::StatusBuilder.perform(self)
      end
    end

  end

end