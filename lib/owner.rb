require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []
  @@count = 0
  @@reset_all
  
  def initialize(species)
    @species = species
    @@all << self
    @@count += 1
    @pets = {:cats => [], :dogs => [], :fishes => []}
  end
  
  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end
  
  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def walk_dogs
    @pets[:dogs].each {|v| v.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|v| v.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|v| v.mood = "happy"}
  end

  def sell_pets
    @pets.each do |k, v|
      v.each do |x|
        x.mood = "nervous"
      end
    end
    @pets = {:cats => [], :dogs => [], :fishes => []}
  end

  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@reset_all
    @@all = []
    @@count = 0
  end

end