require 'spec_helper'

describe 'app' do
  let(:app) { App.new }
  it 'defines many roles' do
    role = Role.new
    app.roles << role
  end
end
