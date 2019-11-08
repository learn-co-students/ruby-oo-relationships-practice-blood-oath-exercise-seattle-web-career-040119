class Follower

  attr_accessor :name, :age, :life_motto, :cults

  @@all = []

  def initialize(name, age, life_motto, cults)
    @name = name
    @age = age
    @life_motto = life_motto
    @cults = cults
    @@all << self
  end

  def self.all
    @@all
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age > age
    end
  end

  # helper
  def my_blood_oaths
    BloodOath.all.select do |bo|
      bo.follower == self
    end
  end
  # 

  def my_cults_slogans
    my_blood_oaths.map do |bo|
      bo.cult.slogan
    end
  end

  def self.most_active
    self.all.max_by do |f|
      f.my_blood_oaths.size
    end
  end

  def self.top_ten 
    self.all.sort_by do |f|
      f.my_blood_oaths.size
    end.pop(10)
  end

end