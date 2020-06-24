require 'pry'
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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(title)
    find_it = self.find_by_name(title)
    if find_it == nil
      self.create_by_name(title)
    else
      find_it
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    from_file = self.new
    split_array = []
    split_array = filename.split(/[\-.]/).map(&:strip)
    from_file.name = (split_array[1])
    from_file.artist_name = split_array[0]
    from_file
  end

  def self.create_from_filename(filename)
    from_file = self.new
    split_array = []
    split_array = filename.split(/[\-.]/).map(&:strip)
    from_file.name = (split_array[1])
    from_file.artist_name = split_array[0]
    from_file.save
    from_file
  end

  def self.destroy_all
    self.all.clear
  end

end #end of Song class
