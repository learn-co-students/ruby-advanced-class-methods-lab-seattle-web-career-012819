require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    this = self.new
    @@all << this
    this
  end

  def self.create_by_name(name)
    this = self.create
    this.name = name
    this
  end

  def self.new_by_name(name)
    this = self.new
    this.name = name
    #shovel this into all
    this
  end

  def self.find_by_name(name)
    song_array = self.all
    song_array.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if (found) == nil
      return (new_song = self.create_by_name(name))
    else
      return found
    end

  end

  def self.alphabetical()
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    file_array = file.split(/\-|\./)
    artist = file_array[0]
    song = file_array[1]
    striped_song = song.strip
    striped_artist = artist.strip
    this = self.new
    this.name = striped_song
    this.artist_name = striped_artist
    return this
  end

  def self.create_from_filename(file)
    file_array = file.split(/\-|\./)
    artist = file_array[0]
    song = file_array[1]
    striped_song = song.strip
    striped_artist = artist.strip
    this = self.create
    this.name = striped_song
    this.artist_name = striped_artist
    return this
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
end
