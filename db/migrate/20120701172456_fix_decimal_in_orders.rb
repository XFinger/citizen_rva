class FixDecimalInOrders < ActiveRecord::Migration
  def up
    change_column :orders, :ttl_price, :decimal, :precision => 10, :scale => 2
    change_column :orders, :sub_ttl, :decimal, :precision => 10, :scale => 2
    change_column :orders, :tax, :decimal, :precision => 10, :scale => 2
  
  end

  def down
  end
end
