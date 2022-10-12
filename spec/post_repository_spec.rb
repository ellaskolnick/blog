require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_comments.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  it "finds one post with comments" do
    repo = PostRepository.new
    post = repo.find_with_comments(1)

    expect(post.name).to eq 'Blueberries'
    expect(post.comments.length).to eq 2
  end
end
