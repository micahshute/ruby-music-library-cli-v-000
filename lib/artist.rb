require 'pry'
class Artist
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :songs, :genres, :name

  def initialize(name)
    super(name)
    @songs = []
    @genres = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs.push(song) unless self.songs.include?(song)
    add_genre(song.genre) unless !song.genre || song.genre.artists.include?(self)
    binding.pry
    song
  end

  def add_genre(genre)
    self.genres.push(genre) unless self.genres.include?(genre)
    genre.artists.push(self) unless genre.artists.include?(self)
    binding.pry
    genre
  end


end
