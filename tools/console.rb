require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# cult => blood oath <= follower

c1 = Cult.new("Seattle Blood", "Seattle", 2010, "Blood rules", 18)
c2 = Cult.new("Downtown Blood Club", "Portland", 2001, "I love blood", 21)
c3 = Cult.new("Blood Lovers", "Portland", 2001, "We love blood", 21)

f1 = Follower.new("Joe Joeson", 30, "I love cults", ["Seattle Blood", "Downtown Blood Club"])
f2 = Follower.new("John Jones", 70, "Cults are nice", "Downtown Blood Club")
f3 = Follower.new("Tony Talbot", 4, "Cults are nice", "Downtown Blood Club")

bo1 = BloodOath.new(c1, f1)
bo2 = BloodOath.new(c2, f2)
bo3 = BloodOath.new(c2, f3)
bo4 = BloodOath.new(c1, f3)


Pry.start

puts "Mwahahaha!" # just in case pry is buggy and exits

