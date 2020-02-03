class Customer
  attr_accessor :name,  :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age 
    @@all << self
  end

  def self.all
    @@all 
  end

  # We're iterating through every instance of Meal
  # and returning only the ones where the meal's customer matches the current customer instance.
  
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def new_meal(waiter, total, tip=0) #customer not needed as argement since we use self
    Meal.new(waiter, self, total, tip)
  end

  def waiters
    meals.map do |meal|
        meal.waiter
    end
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
 
  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end
 
  def self.oldest_customer
    oldest_age = 0
    oldest_customer = nil
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer.age
        oldest_customer = customer
      end
    end
    oldest_customer
  end
 
end