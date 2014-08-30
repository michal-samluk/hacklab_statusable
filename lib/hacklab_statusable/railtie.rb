module HacklabStatusable

  def self.setup_orm(base)
    base.class_eval do
      include HacklabStatusable::Statusable
    end
  end

end