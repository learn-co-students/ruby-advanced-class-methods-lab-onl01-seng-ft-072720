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
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end
  
  def self.crete_by_artist_name(artist_name)
    song = Song.create 
    song.artist_name = artist_name 
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort{|a, b| a.name <=> b.name}
  end
  
  def self.new_from_filename(file)
    split = file.split('-')
    artist = split[0].strip
    name = split[1].split('.')[0].strip
    song = Song.new
    song.name = name 
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end



end
