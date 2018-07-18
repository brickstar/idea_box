require 'rails_helper'

describe 'user' do
  it 'can navigate' do
    skip
    user = User.create(username: 'heidi', password: 'love', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path


  end
end
