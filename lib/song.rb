require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
        song
      end
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
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    data = filename.split(" - ")
    song.name = data[1].split(".")[0]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    data = filename.split(" - ")
    song.name = data[1].split(".")[0]
    song.artist_name = data[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end #end of Song Class
