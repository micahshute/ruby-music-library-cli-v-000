class Artist
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []
  attr_accessor :songs, :genres

  def initialize(name)
    super(name)
    @songs = []
    @genres = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    self.songs.push(song) unless self.songs.include?(song)
    add_genre(song.genre) unless !song.genre || song.genre.artists.include?(self)
    song
  end

  def add_genre(genre)
    self.genres.push(genre) unless self.genres.include?(genre)
    genre.push(self) unless genre.artists.include?(self)
    genre
  end


end
