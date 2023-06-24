class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  def subtotal
    item.with_tax_price * amount
  end

  belongs_to :customer

end
