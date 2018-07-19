require 'rails_helper'

describe 'admin visits admin categories index' do
  it 'should be able to destroy a category' do
    category = Category.create(title: 'Green')
    admin = User.create(username: 'heidi', password: 'love', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_on('delete')

    expect(current_path).to eq(admin_categories_path)
    expect(Category.all.empty?).to eq(true)
  end
end
