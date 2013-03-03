module BillsHelper
  def bill_submit_label
    if @bill
      @bill.new_record? ? "Create bill" : "Update bill"
    end
  end
end
