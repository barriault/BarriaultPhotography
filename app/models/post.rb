class Post < ActiveRecord::Base
  attr_accessible :title, :content, :published_at
  
  validates_presence_of :title
  validates_presence_of :content
  
  scope :published, lambda { 
    where("posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now).order('published_at DESC')
  }  
  
  def published_date
    published_at.strftime("%m/%d/%Y")
  end
end
