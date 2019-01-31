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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
  end

  def self.find_by_name(name)
    song = @@all.select { |ref| ref.name==name }
    song = (song==nil) ? false : song[0]
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    made_song = !found_song ? self.create_by_name(name) : false
    !found_song ? made_song : found_song
  end

  def self.alphabetical
    @@all.sort { |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(file_name)
    song = self.create
    sep = file_name =~ / - /
    song.name = file_name.chars[sep + 3..file_name.length-5].join("")
    song.artist_name = file_name.chars[0..sep-1].join("")
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song
  end

  def self.destroy_all
    until @@all.empty? do @@all.pop end
  end
end