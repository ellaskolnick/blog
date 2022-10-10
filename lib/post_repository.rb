require_relative '../lib/post.rb'
require_relative '../lib/comment.rb'
require_relative '../lib/database_connection.rb'

class PostRepository
  def find_with_comments(id)
    sql = 'SELECT posts.id,
                  posts.name,
                  posts.content,
                  comments.id AS comment_id,
                  comments.name AS comment_name,
                  comments.content AS comment_content
          FROM posts
          JOIN comments ON comments.post_id = posts.id
          WHERE posts.id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    post = Post.new

    post.id = result.first['id']
    post.name = result.first['name']
    post.content = result.first['content']

    result.each do |record|
      comment = Comment.new
      comment.id = record['comment_id']
      comment.name = record['comment_name']
      comment.content = record['comment_content']

      post.comments << comment
    end

    post
  end
end
