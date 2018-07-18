class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    self.all.detect { |artist| artist.name = name } || Artist.new(name)
  end

  def add_song(song)
    @songs.push(song) unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
    self
  end

  def print_songs
      @songs.each { |song| puts song.name }
  end

end
