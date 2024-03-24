
class Raspberry
   STATES = [:None, :Flowering, :Green, :Red]
  
   def initialize (index, state = STATES[0])
    @index = index
    @state = state
   end
  
   def grow!
    next_index = STATES.index(@state) + 1
    @state = STATES[next_index]
   end
   
   def ripe?
    @state = STATES.last
   end
end

class RaspberryBush

    def initialize(count)
        @raspberries = []
        count.times do |n|
            @raspberries << Raspberry.new(n)
        end
    end
    
    def grow_all!
       @raspberries.each(&:grow!)
    end

    def ripe_all?
       @raspberries.all?(&:ripe?)
    end

    def give_away_all!
        @raspberries.clear
    end
end

class Human
    
    def initialize(name, plant)
        @name = name
        @plant = plant
    end
    
    def work!
        @plant.grow_all!
    end

    def harvest
        if @plant.ripe_all?
            puts "сборка урожая"
            @plant.give_away_all!
        else 
            puts "Еще рано"
        end

    end

    def self.knowleadge_base
        puts "Я ебу?"
    end
end

