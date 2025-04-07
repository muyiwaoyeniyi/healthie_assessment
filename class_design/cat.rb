# frozen_string_literal: true

class Cat
  LIKES = %w[CatFood Chicken Milk].freeze

  def eat(food)
    count = LIKES.include?(food.class.name) ? 3 : 1
    count.times { meow }
  end

  private

  def meow
    puts 'meow'
  end
end
