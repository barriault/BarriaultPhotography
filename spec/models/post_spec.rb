require "spec_helper"

describe Post do
  it "requires title and content" do
    post = Post.new
    post.should have(1).error_on(:title)
    post.should have(1).error_on(:content)
  end
  
  it "finds published" do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    c = Factory(:post)
    Post.published.should include(a)
    Post.published.should_not include(b)
    Post.published.should_not include(c)
  end

  it "sorts published posts in descending order" do
    Post.delete_all
    p1 = Factory(:post, :published_at => 3.weeks.ago)
    p2 = Factory(:post, :published_at => 2.weeks.ago)
    p3 = Factory(:post, :published_at => 4.weeks.ago)
    Post.published.should eq([p2, p1, p3])
  end

end