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

    logger.debug selected

    options_for_select options, selected
  end
end
