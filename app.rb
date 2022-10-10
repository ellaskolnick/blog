require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('blog')

class Application
  def initialize(database_name, io, post_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @post_repository = post_repository
  end

  def run
    id = prompt "Please enter the id of the post you wish to see:"
    print_post(id)
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    @io.gets.chomp
  end

  def print_post(id)
    post = @post_repository.find_with_comments(id)
    show "Post: #{post.name.capitalize} - #{post.content}"
    show "Comments:"
    post.comments.each do |comment|
      show "  * '#{comment.content}' - #{comment.name}"
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'blog',
    Kernel,
    PostRepository.new
  )
  app.run
end
