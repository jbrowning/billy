module ApplicationHelper
  def title(title=nil)
    @title ||= (title || "Bill Manager")
  end

  def day_of_month_options(selected_value=0)
    first_option = [ "First day of month", 0 ]
    last_option = ["Last day of month", -1]

    options = (1..31).map {|n| [n, n] }
    options.unshift first_option
    options << last_option

    selected = options[selected_value]

    options_for_select options, selected
  end

  def iconize(icon_name=:star, white=false)
    classes = "icon-#{icon_name.to_s}"
    classes += " icon-white" if white
    content = block_given? ? " #{yield}" : ''

    icon_tag = content_tag :i, nil, class: classes
    icon_tag += content
  end
end
