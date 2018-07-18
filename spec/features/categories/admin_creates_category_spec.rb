require 'rails_helper'

describe 'admin visits admin categories' do
  it 'should be able to create a category' do
    admin = User.create(username: 'pearl', password: 'love', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  end
end
