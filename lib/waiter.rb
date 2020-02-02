class Waiter
    attr_accessor :name, :years_of_exp, :customer, :total, :tip

    @@all = []

    def initialize(name, years_of_exp)
        @@name = name
        @@years_of_exp = years_of_exp
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        biggest_tip = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        biggest_tip.customer
    end
end