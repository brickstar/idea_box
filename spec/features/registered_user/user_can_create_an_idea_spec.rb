require 'rails_helper'

describe 'registered user' do
  describe 'visits show' do
    it 'should be able to create an idea' do
      category = Category.create(title: 'Green')
      user = User.create(username: 'heidi', password: 'love', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'I have an idea!'

      expect(current_path).to eq(new_user_idea_path(user))

      fill_in 'idea[title]', with: 'idea title'
      fill_in 'idea[description]', with: 'my amazing idea'
      select category[:title], from: 'idea[category_id]'

      click_on 'Create Idea'

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content('Idea Saved!')
      expect(page).to have_content('idea title')
      expect(page).to have_content('my amazing idea')
    end
  end
end
