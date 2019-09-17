class Background
  attr_reader :id, :url

  @@id = 0
  def initialize(data)
    @@id += 1
    @id = 0
    @url = data
  end
end
