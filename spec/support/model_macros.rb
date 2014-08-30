module ModelMacros
  PROJECT_DEFAULTS = {
      name: 'Hacklab',
      status: 0
  }

  def new_project(params={})
    Project.new(PROJECT_DEFAULTS.merge(params))
  end

  def create_project(params={})
    new_project(params).tap { |p| p.save! }
  end

end