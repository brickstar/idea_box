require 'rails_helper'

describe 'user visits categories index' do
  describe 'as admin' do
    it 'should see all categories' do
      admin = User.create(username: 'pearl', password: 'love', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
  end

  describe "as default user" do
    it 'does not allow default user to see admin categories index' do
      user = User.create(username: 'heidi', password: 'love', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
