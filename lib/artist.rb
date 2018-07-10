class Artist
  extend Concerns::Findable
  include Concerns::Savable

  attr_accessor :songs, :genres

  def initialize(name)
    super(name)
    @songs = []
    @genres = []
  end

  def add_song(song)
    song.artist = self
    self.songs.push(song) unless self.songs.include?(song)
  end

  def add_genre(genre)
    self.genres.push(genre) unless self.genres.include?(genre)
  end

end
