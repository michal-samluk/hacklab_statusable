require 'spec_helper'
describe HacklabStatusable::Statusable do

  it '#ok?' do
    expect(User.new.ok?).to eq 'It works fine!'
  end

end