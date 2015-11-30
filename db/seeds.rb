if Rails.env.development?
  Product.create(name: "Test Product 1", price: 24.50)
  Product.create(name: "Test Product 2", price: 4.50)
  Product.create(name: "Test Product 3", price: 12.23)

  Customer.create(name: 'Bobby', dob: 25.years.ago).tap do |bobby|
    bobby.orders.create.tap do |order|
      order.line_items.create(product: Product.first, qty_amount: 1,
                              qty_label: 'units', cost: 1 * Product.first.price)

      order.line_items.create(product: Product.last, qty_amount: 3,
                              qty_label: 'units', cost: 3 * Product.last.price)
    end
  end

  Customer.create(name: 'Sandy', dob: 36.years.ago).tap do |sandy|
    sandy.orders.create.tap do |order|
      order.line_items.create(product: Product.second, qty_amount: 2,
                              qty_label: 'lots', cost: 2 * Product.second.price)
    end

    sandy.orders.create.tap do |order|
      order.line_items.create(product: Product.last, qty_amount: 1,
                              qty_label: 'units', cost: 1 * Product.last.price)
      order.line_items.create(product: Product.last, qty_amount: 3,
                              qty_label: 'units', cost: 3 * Product.last.price)
    end
  end
end
