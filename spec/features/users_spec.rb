require 'spec_helper'

describe "Users" do
  context "when logged out" do
    describe "GET '/'" do
      it "should have a login link" do
        visit '/'
        page.should     have_content "Sign in"
        page.should_not have_content "Sign out"
      end
    end
  end

  describe "logging in" do
    let(:user) { create(:user) }

    it "should be successful with valid credentials" do
      visit "/"
      find(".nav").click_link "Sign in"
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'

      click_button "Sign In"

      page.should have_content "Sign out"
      page.should_not have_content "Sign in"
    end
  end

  context "when logged in" do

  end



end
