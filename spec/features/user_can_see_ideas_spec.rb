require 'rails_helper'

describe 'registered user visits their show page' do
  it 'should see all their ideas' do
    user = User.create!(username: 'heidi', password: 'love', role: 0)
    category = Category.create!(title: 'Green')
    idea1 = user.ideas.create!(title: 'idea1', description: 'this is my first idea', category: category)
    idea2 = user.ideas.create!(title: 'idea2', description: 'this is my second idea', category: category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content(idea1.title)
    expect(page).to have_content(idea2.description)
  end
end
