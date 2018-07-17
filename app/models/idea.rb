class Idea < ApplicationRecord
  validates_presence_of(:title, :description)
  
  belongs_to :category
end
