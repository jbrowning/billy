require 'spec_helper'

describe "Users" do
  describe "GET '/'" do
    it "should have a login link" do
      visit '/'
      page.should     have_content "Login"
      page.should_not have_content "Logout"
    end
  end

  # describe "logging in" do
  #   let(:user) { create(:user) }
  #   it "should show the logout link if the user has logged in" do

  #       visit "/"
  #       page.should have_content "Log out"
  #       page.should_not have_content "Log in"
  #     end
  #   end
  # end

end
