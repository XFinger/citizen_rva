class AddDateTpPunchclocks < ActiveRecord::Migration
  def up
    add_column :punchclocks, :paydate, :date
  end

  def down
  end
end
