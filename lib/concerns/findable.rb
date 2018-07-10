module Concerns

  
  module Findable
    @@all = []

    def all 
      @@all
    end

    def find_by_name(name)
      @all.find{|inst| inst.name == name}
    end

    def find_or_create_by_name(name)
      find_attempt = self.find_by_name
      !!find_attempt ? find_attempt : self.new(name)
    end

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      new_instance
    end

    
  end

  
  module Savable

    def initialize(name)
      self.name = name
    end
    
    def save
      self.class.all << self
    end
    
  end

  
end