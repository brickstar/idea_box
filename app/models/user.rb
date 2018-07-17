class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_many :ideas, dependent: :destroy

  enum role: ['default', 'admin']

  has_secure_password
end
