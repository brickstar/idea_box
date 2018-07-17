class Idea < ApplicationRecord
  validates_presence_of(:title, :description)

  belongs_to :category
  has_many :image_ideas
  has_many :images, through: :image_ideas
end
