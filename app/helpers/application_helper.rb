module ApplicationHelper
  def rounded_price(price)
    number_with_precision(price, precision: 0)
  end
end
