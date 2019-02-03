class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new #song == Song the class
    self.all << song
    return song
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  #song =self.new
  song = self.create #use the create method to save songs
  song.name =name
  #@@all << song
  song
end

def self.find_by_name(name)
  self.all.find do |i|
    i.name == name
  end
end

def self.find_or_create_by_name(name)
 created_song = self.find_by_name(name)

  if !created_song
    self.create_by_name(name)
  else
    created_song
  end
end

def self.alphabetical
  self.all.sort_by do |song|
    song.name
  end
end

def self.new_from_filename(name)
  artist_n = name.split.first #split the first part of the string for name
  song_name = name.split(' - ').last.chomp(".mp3") #retrive the song name without the format
  song = self.new_by_name(song_name)
  song.artist_name = artist_n
  song
end

def self.create_from_filename(name)
  artist_n = name.split.first #split the first part of the string for name
  song_name = name.split(' - ').last.chomp(".mp3") #retrive the song name without the format
  song = self.create_by_name(song_name)
  song.artist_name = artist_n
  song
end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.destroy_all
  self.all.clear

end
end
