require 'bundler/setup'
require 'hacklab_statusable'
require 'rails/version'

class User
  include HacklabStatusable::Statusable
end

# After each example, revert changes made to the class
def protect_class(klass)
  before { stub_const klass.name, Class.new(klass) }
end

def protect_module(mod)
  before { stub_const mod.name, mod.dup }
end



