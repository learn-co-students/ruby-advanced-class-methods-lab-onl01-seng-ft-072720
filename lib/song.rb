require 'pry'

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
    song = Song.new 
    @@all.push(song)
    song 
  end 
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song 
  end 
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name 
    @@all.push(song)
    song  
  end 
  
  def self.find_by_name(name)
    @@all.find { |song_obj| song_obj.name == name }
  end 
  
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by {|x| x.name }
  end 
  
  def self.new_from_filename(song_with_filename)
      song = Song.new 
      song.name = song_with_filename.split(" - ")[1].chomp(".mp3")
      song.artist_name = song_with_filename.split(" - ")[0]
      song 
  end 
  
  def self.create_from_filename(song_with_filename)
    song = Song.new
    song.name = song_with_filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = song_with_filename.split(" - ")[0]
    @@all.push(song)
    song 
    end 
    
    def self.destroy_all
      @@all.clear
    end 
  #binding.pry 
end
