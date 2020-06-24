require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name='')
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new

  end

  def self.new_by_name(name)
   self.new(name)
  end

  def self.create_by_name(song_name)
    self.new(song_name)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(str)
    file = str.split(".")[0].split(' - ')
    song = Song.new(file[1])
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(str)
    self.new_from_filename(str)
  end

  def self.destroy_all
    @@all.clear
  end

   #
   # binding.pry
end
