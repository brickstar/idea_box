require 'rails_helper'

describe 'user visits images index' do
  describe 'as admin' do
    it 'should see all the images and link to create new image' do
      admin = User.create(username: 'heidi', password: 'love', role: 1)
      image1 = Image.create!(title: 'green', url: 'https://robohash.org/1')
      image2 = Image.create!(title: 'green', url: 'https://robohash.org/2')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit images_path

      expect(page).to have_content('create a new image')
      expect(page).to have_content(image1.title)
      expect(page).to have_content(image2.title)
    end
  end

  describe 'as default user' do
    it 'should see images and a link to add image to an idea' do
      user = User.create(username: 'heidi', password: 'love', role: 0)
      image1 = Image.create!(title: 'green', url: 'https://robohash.org/1')
      image2 = Image.create!(title: 'green', url: 'https://robohash.org/2')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit images_path

      expect(page).to_not have_content('create a new image')
      expect(page).to have_content(image1.title)
      expect(page).to have_content(image2.title)
    end
  end
end
