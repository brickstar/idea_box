Category.destroy_all
Idea.destroy_all
Image.destroy_all
User.destroy_all

admin = User.create(username: 'Pearl', password: 'love', role: 1)
user  = User.create(username: 'Heidi', password: 'love', role: 0)

IMAGEURLS = []
1000.times do
  IMAGEURLS << "https://robohash.org/#{rand(1000)}"
end

CATEGORIES  = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet",
              "Pink", "Black", "Brown", "Magenta", "Pearl", "Aero", "Aero Blue",
              "Almond", "Aluminum", "Amber", "Gold", "Silver",
              "Ao", "Apple", "Aqua", "Lime", "Lemon", "Apple", "Azure"]

IDEAS       = ["Peace", "Love", "Understanding", "Haromony", "Music", "Friendship", "Family", "Community"]

DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea",
               "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea",
               "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample, user: admin)
  idea.images.create!(url: IMAGEURLS.sample, title: CATEGORIES.sample)
end

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  idea = category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample, user: user)
  idea.images.create!(url: IMAGEURLS.sample, title: CATEGORIES.sample)
end
