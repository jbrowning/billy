module ApplicationHelper

  def title(title=nil)
    @title ||= "Billy - " + (title || "Bill Manager")
  end
end
