require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  it "#markdown converts to html" do
    helper.markdown("hello **world**").strip.should eq("<p>hello <strong>world</strong></p>")
  end
end