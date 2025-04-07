# frozen_string_literal: true

class Dog
  LIKES = %w[DogFood CatFood Chicken HumanFood].freeze

  def eat(food)
    count = LIKES.include?(food.class.name) ? 3 : 1
    count.times { bark }
  end

  private

  def bark
    puts 'bark'
  end
end
