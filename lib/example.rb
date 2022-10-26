class Garden
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def plants
    Plant.all.select do |plant|
      plant.garden == self
    end
  end
end

class Plant
  attr_accessor :garden, :name

  @@all = []

  def initialize(name:)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end

lawn = Garden.new(name: 'Front Lawn') # we can call Garden.new because Garden is defined above

basil = Plant.new(name: 'Basil') # we can call Plant.new because Plant is defined above
basil.garden = lawn

cucumber = Plant.new(name: 'Cucumber')
cucumber.garden = lawn # we can associate a plant and a garden because both are defined above

p lawn.plants
# => [#<Plant:0x00007fa4440ab0c8 @name="Basil", @garden=#<Garden:0x00007fa4440997b0 @name="Front Lawn">>, #<Plant:0x00007fa4440b8bd8 @name="Cucumber", @garden=#<Garden:0x00007fa4440997b0 @name="Front Lawn">>]