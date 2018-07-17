require 'rails_helper'

describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }

    it "uniqueness of username" do
      orig = User.create(username: "user", password: "Password")
      copy_cat = User.new(username: "user", password: "Password")

      expect(copy_cat).to_not be_valid
    end
  end

  describe 'relationships' do
    it { should have_many :ideas }
  end

  describe "roles" do
    it "can be created as an admin" do
      user = User.create(username: "pearl",
                         password: "love",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to eq(true)
    end

    it "can be created as a default user" do
      user = User.create(username: "heidi",
                         password: "love",
                         role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to eq(true)
    end
  end
end
