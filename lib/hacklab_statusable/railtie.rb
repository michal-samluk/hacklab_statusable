module HacklabStatusable

  def self.setup_orm(base)
    base.class_eval do
      raise 'test'
      include HacklabStatusable::Statusable
    end
  end

end