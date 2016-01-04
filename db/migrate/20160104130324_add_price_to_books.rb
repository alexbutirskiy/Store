class AddPriceToBooks < ActiveRecord::Migration
  def change
    add_column :books, :price, :decimal, precision: 6, scale: 2
  end
end
