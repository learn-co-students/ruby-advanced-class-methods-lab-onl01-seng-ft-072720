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
    s = Song.new
    @@all << s
    s
  end

  def self.new_by_name(song)
    s = Song.new
    s.name = song
    s
  end

  def self.create_by_name(song)
    s = Song.new_by_name(song)
    @@all << s
    s
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    s = Song.find_by_name(name)
    unless s
      s = Song.create_by_name(name)
    end
    s
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    artist, name = file.split(" - ")
    s = Song.new
    s.name = name.slice(0...-4)
    s.artist_name = artist
    s
  end

  def self.create_from_filename(song)
    s = Song.new_from_filename(song)
    @@all << s
    s
  end

  def self.destroy_all
    @@all = []
  end

end
