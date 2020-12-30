class Waiter
    @@all=[]
    def initialize(name, experience)
        @name= name
        @experience= experience
        @@all<<self
    end
    def self.all
        @@all
    end
    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end
    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end
    def best_tipper
        ranking = meals.sort_by{|meal| meal.tip}
        winner=ranking[-1]
        winner.customer
    end
end