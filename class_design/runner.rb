# frozen_string_literal: true

# INSTRUCTIONS ON RUNNING THE FILE
# 1. From the terminal, cd into the project directory (class_design)
# 2. Ensure you have Ruby 3+ installed
# 3. Run the command 'ruby runner.rb' to execute the code

# NOTES
# I would consider creating an Animal class and moving the eat method there
# Also, a Food class could be useful but I don't have enough information to believe it's needed at this stage

require_relative 'cat'
require_relative 'dog'

require_relative 'cat_food'
require_relative 'dog_food'
require_relative 'human_food'
require_relative 'milk'
require_relative 'lemon'
require_relative 'chicken'

animals = %w[Cat Dog]
foods = %w[CatFood DogFood HumanFood Milk Lemon Chicken]

animals.each do |animal|
  puts "Lunch time for my #{animal}"
  foods.each do |food|
    puts "\nTime to eat #{food}"
    animal_instance = Object.const_get(animal).new
    animal_instance.eat(Object.const_get(food).new)
  end
  puts "\n\n"
end
