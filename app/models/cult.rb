class Cult

  attr_accessor :name, :location, :founding_year, :slogan, :min_age

  @@all = []

  def initialize(name, location, founding_year, slogan, min_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @min_age = min_age
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def cult_population
    cult_members = BloodOath.all.select do |bo|
      bo.cult == self
    end
    cult_members.map do |cult|
      cult.follower
    end.size
  end

  def self.find_by_name(name)
    self.all.select do |cult|
      cult.name == name
    end
  end

  def self.find_by_location(location)
    self.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(founding_year)
    self.all.select do |cult|
      cult.founding_year == founding_year
    end
  end

  # helper
  def members 
    BloodOath.all.select do |bo|
      bo.cult == self
    end
  end

  # 

  def average_age
    ar = members.map do |bo|
      bo.follower.age
    end
    ar.sum / ar.length.to_f
  end

  def my_followers_mottos
    members.map do |bo|
      bo.follower.life_motto
    end
  end

  def self.least_popular
    self.all.min_by do |cult|
      cult.members.size
    end
  end

  def self.most_common_location
    self.all.max_by do |cult|
      cult.location.size
    end.location
  end
end
