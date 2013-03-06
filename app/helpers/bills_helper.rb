module BillsHelper

  def row_style(bill)
    return 'warning' if bill.paid?
  end

  def bill_submit_label
    if @bill
      @bill.new_record? ? "Create bill" : "Update bill"
    end
  end
end
