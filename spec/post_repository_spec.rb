require 'post_repository'

RSpec.describe PostRepository do
  it "finds one post with comments" do
    repo = PostRepository.new
    post = repo.find_with_comments(1)

    expect(post.name).to eq 'Blueberries'
    expect(post.comments.length).to eq 2
  end
end
