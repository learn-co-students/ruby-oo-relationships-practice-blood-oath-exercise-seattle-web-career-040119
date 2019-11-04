class BloodOath

  attr_accessor :cult, :follower

  @@all = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = "#{Time.now.strftime"%F" }"
    @@all << self
  end

  def self.all
    @@all
  end

  def initiation_date
    @initiation_date
  end

  def self.first_oath
    self.all.min_by do |bo|
      bo.initiation_date
    end
  end


end