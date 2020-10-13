require 'pry'

class Owner
  
  attr_reader :name, :species

  @@all = []
  # CLASS METHODS #
  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end
  # INSTANCE METHODS #

  def initialize(name, species="human")
    @name = name 
    @species = species
    self.save
  end

  def save
    @@all << self
  end

  def say_species
    return "I am a #{species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}

  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|cat| cat.owner = nil}
    self.dogs.each {|dog| dog.owner = nil}
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end