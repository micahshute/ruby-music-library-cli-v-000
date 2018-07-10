class Genre
  extend Concerns::Findable
  include Concerns::Savable
  
  @@all = []

  def self.all
    @@all
  end
  attr_accessor :songs, :artists

  def initialize
    @songs = []
    @artists = []
  end

end
