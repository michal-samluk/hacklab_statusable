module ActsAsStatusable

  def self.setup_orm(base)
    base.class_eval do
      include ActsAsStatusable::Statusable
    end
  end

end