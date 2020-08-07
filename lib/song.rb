# .create instantiates and saves the song, and it returns the new song that was create
# .new_by_name instantiates a song with a name property
# .create_by_name instantiates and saves a song with a name property 
# .find_by_name can find a song present in @@all by name returns falsey when a song name is not present in @@all
# .find_or_create_by_name invokes .find_by_name and .create_by_name instead of repeating codereturns the existing Song object (doesn't create a new one) when provided the title of an existing Song creates a new Song object with the provided title if one doesn't already exist
# .alphabetical returns all the song instances in alphabetical order by song name  
# .new_from_filename initializes a song and artist_name based on the filename format  
# .create_from_filename initializes and saves a song and artist_name based on the filename format
# .destroy_all clears all the song instances from the @@all array
   
    
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
    @@all << song
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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical()
    @@all.sort_by{|x| x.name}
  end
  
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    @@all.clear
  end

end