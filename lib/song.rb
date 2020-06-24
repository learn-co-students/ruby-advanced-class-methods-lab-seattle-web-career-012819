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
    self.all << new_song = self.new
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split.first
    name = filename.split(' - ').last.chomp(".mp3")
    new_song = self.new_by_name(name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    artist = filename.split.first
    name = filename.split(' - ').last.chomp(".mp3")
    new_song = self.create_by_name(name)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
