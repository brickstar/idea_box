Category.destroy_all
Idea.destroy_all
Image.destroy_all
User.destroy_all

admin = User.create(username: 'Pearl', password: 'love', role: 1)
user  = User.create(username: 'Heidi', password: 'love', role: 0)


CATEGORIES = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet", "Pink"]
IDEAS = ["Peace", "Love", "Understanding", "Haromony", "Music", "Friendship", "Family", "Community"]
DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea", "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea", "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]
URLS = ['https://robohash.org/a', 'https://robohash.org/b', 'https://robohash.org/c', 'https://robohash.org/d',
        'https://robohash.org/e', 'https://robohash.org/f', 'https://robohash.org/g', 'https://robohash.org/h',
        'https://robohash.org/i', 'https://robohash.org/j', 'https://robohash.org/k', 'https://robohash.org/l',
        'https://robohash.org/m', 'https://robohash.org/n', 'https://robohash.org/o', 'https://robohash.org/p',
        'https://robohash.org/q', 'https://robohash.org/r', 'https://robohash.org/s', 'https://robohash.org/t']


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
