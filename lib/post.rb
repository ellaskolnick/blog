class Post
  attr_accessor :id, :name, :content, :comments

  def initialize
    @comments = []
  end
end
