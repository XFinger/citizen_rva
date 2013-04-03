class CreatePunchclocks < ActiveRecord::Migration
  def change
    create_table :punchclocks do |t|
      t.string :user_name
      t.integer :payperiod
      t.datetime :in
      t.datetime :out
      t.integer :user_id

      t.timestamps
    end
  end
end
