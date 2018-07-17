Category.destroy_all
Idea.destroy_all

CATEGORIES = ["Red", "Orange", "Green", "Yellow", "Blue", "Indigo", "Violet", "Pink"]
IDEAS = ["Peace", "Love", "Understanding", "Haromony", "Music", "Friendship", "Family", "Community"]
DESCRIPTION = ["Perfect Idea", "Wonderfull Idea", "Clever Idea", "Meaningful Idea", "Productive Idea", "Unique Idea", "First Idea", "Last Idea", "Beginning Idea", "Interesting Idea", "Smart Idea", "Genius Idea", "What an Idea!"]


CATEGORIES.each do |title|
  category = Category.create!(title: title)
  puts "Created #{category.title}"
  10.times do |num|
    category.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample)
    puts "Created #{category.ideas[num].title}"
  end
end
