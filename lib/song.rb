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
    newsong = self.new
    self.all << newsong
    newsong
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
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song_i_own = self.find_by_name(name)

    unless song_i_own
      self.create_by_name(name)
    else
      song_i_own
    end
  end

  def self.alphabetical
    self.all.sort_by {|w| w.name.downcase}
  end


## THIS IS ALL FOR THE FILENAME CONVERSION FUNCTIONS
  def self.fixfile(raw)
    temp = raw.split(' - ')
    temp[1].chomp!('.mp3')
    temp
  end

  def self.new_from_filename(raw)
    filename = self.fixfile(raw)
    new = self.new_by_name(filename[1])
    new.artist_name = filename[0]

    new
  end

  def self.create_from_filename(raw)
    filename = self.fixfile(raw)
    new = self.create_by_name(filename[1])
    new.artist_name = filename[0]

    new
  end

  ## THIS IS ALL FOR THE FILENAME CONVERSION FUNCTIONS


  def self.destroy_all
    self.all.clear
  end

end
