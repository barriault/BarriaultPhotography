require 'spec_helper'

describe "Posts request" do
  it "lists published" do
    Factory(:post, :title => "Blast from the Past", :published_at => 2.days.ago)
    Factory(:post, :title => "Back to the Future", :published_at => 2.days.from_now)
    visit posts_path
    page.should have_content("Blast from the Past")
    page.should_not have_content("Back to the Future")
  end
  
  it "shows an individual post" do
    post = Factory(:post, :title => "Blast from the Past", :published_at => 2.days.ago)
    visit post_path(post)
    page.should have_content("Blast from the Past")
  end
  
  it "reports you must sign in before creating a post" do
    visit new_post_path
    page.should have_content("You need to sign in before continuing.")
  end
  
  it "reports you must sign in before editing a post" do
    post = Factory(:post, :title => "Blast from the Past", :published_at => 2.days.ago)
    visit edit_post_path(post)
    page.should have_content("You need to sign in before continuing.")
  end

end