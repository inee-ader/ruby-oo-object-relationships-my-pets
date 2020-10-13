require 'pry'
class Dog
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []
# CLASS METHODS #
  def self.all
    @@all
  end
# INSTANCE METHODS #

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    self.save
  end

  def save
    @@all << self
  end


end