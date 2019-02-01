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
    self.all << Song.new
    self.all.last
  end

  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(name)
    Song.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file_name)
    artist_name, song_name = file_name.sub(".mp3", "").split(" - ")
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    artist_name, song_name = file_name.sub(".mp3", "").split(" - ")
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
  end
end
