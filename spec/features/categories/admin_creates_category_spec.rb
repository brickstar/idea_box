require 'rails_helper'

describe 'admin visits admin categories' do
  it 'should be able to create a category' do
    admin = User.create(username: 'pearl', password: 'love', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_on 'Create New Category'

    expect(current_path).to eq(new_admin_category_path)

    fill_in 'category[title]', with: 'new cat'

    click_on 'Create Category'

    expect(page).to have_content("#{Category.last.title} Created!")
    expect(current_path).to eq(admin_categories_path)
    expect(Category.last.title).to eq('new cat')
  end
end
