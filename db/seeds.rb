Category.destroy_all
Idea.destroy_all
Image.destroy_all
User.destroy_all

CATEGORIES = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet", "Pink"]
IDEAS = ["Peace", "Love", "Understanding", "Haromony", "Music", "Friendship", "Family", "Community"]
DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea", "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea", "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]
TITLES = ["Green Image", "Yellow Image", "Blue Image", "Red Image", "Purple Image", "White Image", "Pink Image", "Black Image"]
URLS = []

CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  10.times do |num|
    category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample)
    Image.create(url: 'www.example.com', title: TITLES.sample)
    puts "Created #{category.ideas[num].title}"
  end
end

User.create(username: 'Pearl', password: 'love')
User.create(username: 'Heidi', password: 'love')
