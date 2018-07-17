require 'rails_helper'

describe 'registered user' do
  describe 'visits show' do
    it 'should be able to update an idea' do
      category = Category.create(title: 'Green')
      user = User.create(username: 'heidi', password: 'love', role: 0)
      idea1 = user.ideas.create!(title: 'title', description: 'my amazing idea', category: category)
      idea2 = user.ideas.create!(title: 'title 2', description: 'other idea', category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      within("#idea-#{idea1.id}") do
        click_on 'change this idea'
      end

      expect(current_path).to eq(edit_user_idea_path(user, idea1))

      fill_in 'idea[title]', with: 'updated title'
      fill_in 'idea[description]', with: 'my updated amazing idea'
      select category[:title], from: 'idea[category_id]'

      click_on 'Update Idea'

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content('Idea Updated!')
      expect(page).to have_content('updated title')
      expect(page).to have_content('my updated amazing idea')
    end
  end
end
