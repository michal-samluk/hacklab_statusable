require 'spec_helper'
describe HacklabStatusable::Statusable do

  it '.acts_as_statusable' do
    Project.acts_as_statusable state: {active: 0, paused: 1, terminated: 2}
    project = new_project
    expect(project).to respond_to(:active?)
    expect(project).to respond_to(:active!)

    expect(project).to respond_to(:terminated?)
    expect(project).to respond_to(:terminated!)

    expect(project).to respond_to(:paused?)
    expect(project).to respond_to(:paused!)
  end

  it '.status (scope)' do
    5.times { create_project(state: 0) }
    12.times { create_project(state: 1) }
    18.times { create_project(state: 2) }
    expect(Project.active.size).to eq 5
    expect(Project.paused.size).to eq 12
    expect(Project.terminated.size).to eq 18
  end

  it '#state' do
    expect(create_project.state).to eq 'Active'
  end

  it '#states' do
    expect(create_project.states).to eq active: 0, paused: 1, terminated: 2
  end

  it '#status!' do
    project = create_project
    expect(project.active?).to be_truthy
    project.paused!
    expect(project.paused?).to be_truthy
    project.terminated!
    expect(project.terminated?).to be_truthy
    project.state = nil
    expect(project.state.nil?).to be_truthy

  end

  it '#status?' do
    project = create_project
    expect(project.active?).to be_truthy
    expect(project.paused?).to be_falsy
    expect(project.terminated?).to be_falsy
  end

end