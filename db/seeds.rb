Category.destroy_all
Idea.destroy_all
Image.destroy_all
User.destroy_all

admin = User.create(username: 'Pearl', password: 'love', role: 1)
user  = User.create(username: 'Heidi', password: 'love', role: 0)

IMAGEURLS = []
100.times do
  IMAGEURLS << "https://robohash.org/#{rand(1000)}"
end

CATEGORIES  = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet",
              "Pink", "Black", "Brown", "Olive", "Pear", "Pearl", "Aero", "Aero Blue",
              "Almond", "Aqua", "Amber", "Gold", "Silver", "Peach", "Teal"]

TITLES      = ["Peace", "Love", "Understanding", "Harmony", "Music", "Friendship", "Family", "Community"]

DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea",
               "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea",
               "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]

CATEGORIES.each do |title|
  category = Category.create!(title: CATEGORIES.sample)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: TITLES.sample, description: DESCRIPTION.sample, user: admin)
  idea.images.create!(url: IMAGEURLS.sample, title: CATEGORIES.sample)
end

CATEGORIES.each do |title|
  category = Category.create!(title: CATEGORIES.sample)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: TITLES.sample, description: DESCRIPTION.sample, user: user)
  idea.images.create!(url: IMAGEURLS.sample, title: CATEGORIES.sample)
end

40.times do
  Image.create(url: IMAGEURLS.sample, title: CATEGORIES.sample)
end
