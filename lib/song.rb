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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
  end
end

  def self.alphabetical
    @@all.sort_by{|instance| instance.name}
  end

  def self.new_from_filename(filename)
    artist_song = []
    artist_song << filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = artist_song[0][1]
    song.artist_name = artist_song[0][0]
    song
  end

  def self.create_from_filename(filename)
    artist_song = []
    artist_song << filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = artist_song[0][1]
    song.artist_name = artist_song[0][0]
    @@all << song
  end


  def self.destroy_all
    @@all.clear
  end

end
