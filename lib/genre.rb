class Genre
  extend Concerns::Findable
  include Concerns::Savable

  @@all = []

  def self.all
    @@all
  end
  attr_accessor :songs, :artists, :name

  def initialize(name)
    super(name)
    @songs = []
    @artists = []
  end

end
