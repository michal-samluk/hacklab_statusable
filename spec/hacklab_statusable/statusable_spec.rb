require 'spec_helper'
describe HacklabStatusable::Statusable do

  it '.acts_as_statusable' do
    Project.acts_as_statusable :state, 0 => :active, 1 => :paused, 2 => :terminated
    project = new_project
    expect(project).to respond_to(:active?)
    expect(project).to respond_to(:active!)

    expect(project).to respond_to(:terminated?)
    expect(project).to respond_to(:terminated!)

    expect(project).to respond_to(:paused?)
    expect(project).to respond_to(:paused!)
  end

  it '.status_name' do
    5.times { create_project(state: 0) }
    12.times { create_project(state: 1) }
    18.times { create_project(state: 2) }
    expect(Project.active.size).to eq 5
    expect(Project.paused.size).to eq 12
    expect(Project.terminated.size).to eq 18
  end

  it '#status' do
    expect(create_project.status).to eq 'Active'
  end

  it '#status_name!' do
    project = create_project
    expect(project.active?).to be_truthy
    project.paused!
    expect(project.paused?).to be_truthy
    project.terminated!
    expect(project.terminated?).to be_truthy
    project.state = nil
    expect(project.status.nil?).to be_truthy

  end

  it '#status_name?' do
    project = create_project
    expect(project.active?).to be_truthy
    expect(project.paused?).to be_falsy
    expect(project.terminated?).to be_falsy
  end

end