require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song if !self.all.include?(song)
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
 
  def self.alphabetical
    self.all.sort_by{ |song| song.name}.uniq
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ").first
    song_name = filename.split(" - ")[1].gsub(".mp3", "")
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" - ").first
    song_name = filename.split(" - ")[1].gsub(".mp3", "")
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
