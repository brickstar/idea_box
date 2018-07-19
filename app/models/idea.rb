class Idea < ApplicationRecord
  validates_presence_of(:title, :description)

  belongs_to :category
  belongs_to :user
  has_many :image_ideas, dependent: :destroy
  has_many :images, through: :image_ideas
end
