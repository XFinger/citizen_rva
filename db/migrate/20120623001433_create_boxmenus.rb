class CreateBoxmenus < ActiveRecord::Migration
  def change
    create_table :boxmenus do |t|

      t.timestamps
    end
  end
end
