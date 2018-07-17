class Image < ApplicationRecord
  validates_presence_of(:title, :url)
end
