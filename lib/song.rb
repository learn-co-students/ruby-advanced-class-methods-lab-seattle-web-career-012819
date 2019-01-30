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
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = self.create
    new.name = name
    new
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    existing_song = self.find_by_name(name)

    unless existing_song
      self.create_by_name(name)
    else
      existing_song
    end

  end

  def self.alphabetical
    self.all.sort { |song_a, song_b| song_a.name <=> song_b.name }
  end

  def self.new_from_filename(format)
    file_name = self.split_filename(format)

    new = self.new_by_name(file_name[2])
    new.artist_name = file_name[1]
    
    new
  end

  def self.create_from_filename(format)
    file_name = self.split_filename(format)

    new = self.create_by_name(file_name[2])
    new.artist_name = file_name[1]
    
    new
  end

  def self.split_filename(file_name)
    file_name.split(/(.+) - (.+).mp3/)
  end

  def self.destroy_all
    @@all.clear
  end

end
