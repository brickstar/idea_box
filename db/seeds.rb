Category.destroy_all
Idea.destroy_all
Image.destroy_all
User.destroy_all

admin = User.create(username: 'Pearl', password: 'love', role: 1)
user  = User.create(username: 'Heidi', password: 'love', role: 0)


CATEGORIES = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet", "Pink"]
IDEAS = ["Peace", "Love", "Understanding", "Haromony", "Music", "Friendship", "Family", "Community"]
DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea", "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea", "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]
URLS = ['https://robohash.org/1', 'https://robohash.org/a', 'https://robohash.org/b', 'https://robohash.org/e', 'https://robohash.org/c', 'https://robohash.org/d', 'https://robohash.org/f']


CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample, user: admin)
  idea.images.create!(url: URLS.sample, title: CATEGORIES.sample)
end

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample, user: user)
  idea.images.create!(url: URLS.sample, title: CATEGORIES.sample)
end
