class Song
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []
  def self.all
    @@all
  end

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    self.artist.add_genre(genre) unless self.artist.nil? || self.artist.genres.include?(genre)
    genre.songs.push(self) unless genre.songs.include?(self)
  end

end
