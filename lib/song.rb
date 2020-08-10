require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    @@all << s.save
    s
  end

  def self.new_by_name(string_name_of_a_song)
    s = self.new
    s.name = string_name_of_a_song
    s.save
    s
  end

  def self.create_by_name(string_name_of_a_song)
    s = self.new
    s.name = string_name_of_a_song
    s.save
    s
  end

  def self.find_by_name(string_name_of_a_song)
    s = self.new
    self.all.find{|i| i.name == string_name_of_a_song}
  end

  def self.find_or_create_by_name(find_song)
     s = self.new
     if find_by_name(find_song)
        find_by_name(find_song)
     else
        create_by_name(find_song)
     end
  end

  def self.alphabetical
     self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(file_name)
      file = file_name.split(" - ")
      new_song = new_by_name(file[1].chomp(".mp3"))
      new_song.artist_name = file[0]
      new_song
    end

    def self.create_from_filename(file_name)
      file = file_name.split(" - ")
      new_song = create_by_name(file[1].chomp(".mp3"))
      new_song.artist_name = file[0]
      new_song
    end

  def self.destroy_all
     self.all.clear
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
