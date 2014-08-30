module HacklabStatusable

  class Railtie < Rails::Railtie
    initializer "draper.setup_orm" do |app|
      ActiveSupport.on_load :active_record do
        HacklabStatusable.setup_orm self
      end
    end
  end

end