class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :s_start
      t.date :s_end

      t.timestamps
    end
  end
end
