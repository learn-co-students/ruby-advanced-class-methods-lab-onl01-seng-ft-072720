require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
    #returns just titles alphebatized by name in array
    # song_names = []
    # self.all.each{|song| song_names << song.name
    # }
    # song_names.sort
  end

  def self.new_from_filename(filename)
    song = self.new

    #get artist_name
    songdata = filename.split(' - ')
    song.artist_name = songdata[0]

    #get name
    songname = songdata[1].to_s
    songname = songname.split('.')
    song.name = songname[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new

    #get artist_name
    songdata = filename.split(' - ')
    song.artist_name = songdata[0]

    #get name
    songname = songdata[1].to_s
    songname = songname.split('.')
    song.name = songname[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end




end

# newsong = Song.create("Wind", "Jeff Jeffy")
