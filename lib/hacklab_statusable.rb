require 'hacklab_statusable/version'
require 'hacklab_statusable/statusable'
require 'hacklab_statusable/railtie' if defined?(Rails)

module HacklabStatusable

  def self.setup_orm(base)
    base.class_eval do
      include HacklabStatusable::Statusable
    end
  end

end