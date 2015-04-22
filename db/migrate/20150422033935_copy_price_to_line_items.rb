class CopyPriceToLineItems < ActiveRecord::Migration
  def up
    # copy all price in line items from products
    LineItem.all.each do |item|
      if item.product_id
        item.price = item.product.price
        item.save!
      end
    end
  end

  def down
    # clear all price data in line_items table
    LineItem.all.each do |item|
      if item.product_id
        item.price = nil
        item.save!
      end
    end
  end
end
