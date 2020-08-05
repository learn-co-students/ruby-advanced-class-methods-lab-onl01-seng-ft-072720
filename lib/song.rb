class Song
  attr_accessor :name, :artist_name
  @@all = []



 def self.create
    @@all.push(self.new)
    @@all[-1]
  end

  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.new_by_name(name)
  s = self.new 
  s.name = name 
  s 
end

def self.create_by_name(name)
  s = self.new
  s.name = name
  s.save
  s 
end

def self.find_by_name(name)
  result = nil 
  @@all.each do |i|
    result = i if i.name == name 
  end
  result
end

def self.find_or_create_by_name(name)
  part_one = self.find_by_name(name)
  if part_one == nil 
    part_two = self.create_by_name(name)
  else part_one 
  end
end


def self.alphabetical
  @@all.sort_by { |i| i.name }
 
end

def self.new_from_filename(name)
  s = self.new 
 a = []
b = []
a = name.split(".mp3")
b = a[0].split("-")
s.name = b[1].strip
s.artist_name = b[0].strip
s 

end

def self.create_from_filename(name)
    s = self.new 
 a = []
b = []
a = name.split(".mp3")
b = a[0].split("-")
s.name = b[1].strip
s.artist_name = b[0].strip
s.save

end

def self.destroy_all
  self.all.clear
end

end