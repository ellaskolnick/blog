require_relative '../app'

RSpec.describe Application do
  it "runs with post Blueberries" do
    io = double :io
    comment = double :comment, name: "Harry Styles", content: "I prefer watermelons"
    comment2 = double :comment, name: "Taylor Swift", content: "I prefer red berries"
    comments = [comment, comment2]
    post = double :post, comments: comments, name: "Blueberries", content: "I am blue!", id: "1"
    post_repository = double :post_repository
    allow(post_repository).to receive(:find_with_comments).with("1").and_return(post)
    app = Application.new('blog_test', io, post_repository)
    expect(io).to receive(:puts).with("Please enter the id of the post you wish to see:")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Post: Blueberries - I am blue!")
    expect(io).to receive(:puts).with("Comments:")
    expect(io).to receive(:puts).with("  * 'I prefer watermelons' - Harry Styles")
    expect(io).to receive(:puts).with("  * 'I prefer red berries' - Taylor Swift")
    app.run
  end
end
