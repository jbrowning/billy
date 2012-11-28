require 'spec_helper'

describe "Users" do
  describe "GET /" do
    it "should have a login link" do
      visit '/'
      page.should have_content "Log in"
    end
  end
end
