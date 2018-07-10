class Song
  extend Concerns::Findable
  include Concerns::Savable

  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push(self) unless genre.songs.include?(self)
  end

end
