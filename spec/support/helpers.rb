require "spec_helper"

include Devise::TestHelpers
include Warden::Test::Helpers
Warden.test_mode!

# Lovingly stolen from
# http://schneems.com/post/15948562424/speed-up-capybara-tests-with-devise

def as_user(user=nil, &block)
  current_user = user || Factory.create(:user)
  if (defined? request && request.present?)
    sign_in(current_user)
  else
    login_as(current_user, :scope => :user)
  end
  block.call if !block.nil?
  return self
end


def as_visitor(user=nil, &block)
  current_user = user || Factory.stub(:user)
  if (defined? request && request.present?)
    sign_out(current_user)
  else
    logout(:user)
  end
  block.call if !block.nil?
  return self
end