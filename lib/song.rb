require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(v = nil)
    @name = v
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new(name)
    song
  end

  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    # binding.pry
    filename = filename.split(" - ")
    filename[-1] = filename[-1].chomp(".mp3")
    song = self.new
    song.artist_name = filename[0]
    song.name = filename[-1]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end


  def self.destroy_all
    @@all.clear
  end

end
