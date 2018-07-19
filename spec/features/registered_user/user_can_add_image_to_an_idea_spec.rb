require 'rails_helper'

describe 'registered user' do
  describe 'visits show' do
    it 'should be able to add an image to an idea' do
      category = Category.create(title: 'Green')
      user = User.create(username: 'heidi', password: 'love', role: 0)
      idea1 = user.ideas.create!(title: 'title', description: 'my amazing idea', category: category)
      idea2 = user.ideas.create!(title: 'title 2', description: 'other idea', category: category)
      image1 = Image.create(title: 'Red', url: 'https://robohash.org/1')
      image2 = Image.create(title: 'Green', url: 'https://robohash.org/2')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      within("#idea-#{idea1.id}") do
        click_on 'Add an Image'
      end

      expect(current_path).to eq(user_idea_images_path(user, idea1))

      within("#image-#{image1.id}") do
        click_on 'Add Image'
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(image1.title)
    end
  end
end
