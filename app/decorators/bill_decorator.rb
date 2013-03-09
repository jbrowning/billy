class BillDecorator < Draper::Decorator
  DATE_FORMAT = "%b %-d"
  
  delegate_all

  def date_due
    source.date_due.strftime(DATE_FORMAT) if source.date_due.present?
  end

  def date_paid
    source.date_paid.strftime(DATE_FORMAT) if source.date_paid.present?
  end

  def table_toolbar
    toolbar = ""
    toolbar += pay_button unless source.paid?
    toolbar += settle_button unless source.settled?
    toolbar += edit_button
    toolbar += destroy_button
    toolbar.html_safe
  end

  def pay_button
    h.link_to "$", h.pay_bill_path(source), class: 'btn btn-small btn-success', method: :put
  end
  
  def settle_button
    h.link_to h.iconize(:ok, true), h.settle_bill_path(source), class: 'btn btn-small btn-primary', method: :put
  end

  def edit_button
    h.link_to h.iconize(:pencil), h.edit_bill_path(source), class: 'btn btn-small'
  end

  def destroy_button
    h.link_to h.iconize(:remove, true), h.bill_path(source), :class => "btn btn-danger btn-small destroy-billing-period", method: :delete, confirm: "Are you sure you want to delete this bill?" 
  end
end
