require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = ""
    @artist_name = ""
  end

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
    @@all << song
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    file1 = file.split(' - ')
    file2 = file1[1].split('.')
    new_song = Song.new
    new_song.name = file2[0]
    new_song.artist_name = file1[0]
    new_song
  end

  def self.create_from_filename(file)
    file1 = file.split(' - ')
    file2 = file1[1].split('.')
    new_song = Song.new
    new_song.name = file2[0]
    new_song.artist_name = file1[0]
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end



end
