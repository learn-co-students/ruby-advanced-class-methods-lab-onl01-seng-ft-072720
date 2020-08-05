require 'pry'
class Song
  self.attr_accessor :name, :artist_name #I wrotre this line
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil) #I wrote
    @name = name
    @artist_name = artist_name
  end

  def name
    @name
  end
# I added the methods above and below this comment;
  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil, artist_name = nil)
    self.new(name, artist_name).save
    @@all.last
  end

  def self.new_by_name(name)
    self.new(name)
    #binding.pry
  end

  def self.create_by_name(name)
    self.create(name)

  end

  def self.find_by_name(name)
    found = @@all.find {|obj| obj.name == name}
    found
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by {|song| song.name}
    #binding.pry
    sorted
  end

  def self.new_from_filename(file)
    half = file.split("-", 4)
    half2 = half[1].split(".")
    name = half2[0].strip
    artist_name = half[0].strip
#binding.pry
    self.new(name, artist_name)

  end

  def self.create_from_filename(file)
    half = file.split("-", 4)
    half2 = half[1].split(".")
    name = half2[0].strip
    artist_name = half[0].strip

    self.create(name, artist_name)
  end

  def self.destroy_all
    @@all.clear
  end

end
