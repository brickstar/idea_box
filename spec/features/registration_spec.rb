require 'rails_helper'

describe 'registration workflow' do
  it 'submits a registration successfully' do
    username = 'Pearl'

    visit root_path

    click_on 'Sign Up!'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: 'sosecret'

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{username}!")
  end

  it 'submits a registration form with duplicate username' do
    username = 'Pearl'
    User.create!(username: username, password: 'sosecret')
    count = User.count

    visit root_path

    click_on 'Sign Up!'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: '12345'

    click_on 'Create User'

    expect(current_path).to eq(new_user_path)
    expect(User.count). to eq(count)
  end
end
