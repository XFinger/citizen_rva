class CreateSalads < ActiveRecord::Migration
  def change
    create_table :salads do |t|
      t.string :sal_name
      t.string :sal_description
      t.string :useable_id
      t.string :useable_type
      t.decimal :sal_price,       :precision => 4, :scale => 2
      t.integer :sal_count

      t.timestamps
    end
  end
end
