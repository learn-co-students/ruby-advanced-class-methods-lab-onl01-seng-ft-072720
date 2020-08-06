require "pry"
class Song
  attr_accessor :name, :artist_name 
  @@all = []

  def self.create 
    @song = self.new 
    @@all << @song
    return @song 
  end
  
  
  def self.new_by_name(name)
    @song.name = name
    return @song
  end
  
  def self.create_by_name(song_name)
    @song.name = song_name
    @@all << @song
    return @song
  end
    
  def self.find_by_name(song_name)
    self.all.find do |song| 
      if song.name == song_name
        return song
      elsif self.all.!include?(song_name)
        return nil 
      end
    end
  end
  
  def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name) != nil
        return self.find_by_name(song_name)      
      
      elsif self.find_by_name(song_name) == nil
        self.create_by_name(song_name)
      
       
      end
    end
  
  def self.alphabetical 
    sort = @@all.sort 
    return sort
  end
  
  def self.new_from_filename(filename)
    split1 = filename.split("-")
    split3 = split1[0]
    split3 = split3.strip 
    split2 = split1[1]
    split2 = split2.strip
    split2 = split2.split(".")
    @song.artist_name = split3
    @song.name = split2[0]
    return @song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @@all << @song 
    
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

end
