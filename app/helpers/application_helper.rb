module ApplicationHelper

  def title(title=nil)
    @title ||= title || "Bill Manager"
  end
end
